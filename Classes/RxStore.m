//
//  RxStore.m
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RxStore.h"
#import "NSArray+Redux.h"
#import "Macros.h"

@interface RxSubscription : NSObject
@property (weak, nonatomic) id<RxSubscriber> subscriber;
@property (copy, nonatomic) RxStateSelector stateSelector;
@end @implementation RxSubscription @end

@interface RxInitAction : NSObject <RxAction>
@property (strong, nonatomic, readonly) NSString *type;
@end @implementation RxInitAction
- (instancetype ) init {
    if([super init]) {
        _type = @"Redux.Init.Action";
    }
    return self;
}
@end

@interface RxStore()
@property (copy, nonatomic) RxDispatchFunction dispatchFunction;
@property (copy, nonatomic) RxReducer reducer;
@property (strong, nonatomic) NSMutableArray *subscriptions;
@property (assign, nonatomic) BOOL isDispatching;
@end


@implementation RxStore

- (instancetype) initWithState:(id<RxState>)rootState reducer:(RxReducer)rootReducer {
    return [self initWithState:rootState reducer:rootReducer middlewares:@[]];
}
- (instancetype) initWithState:(id<RxState>)rootState reducer:(RxReducer)rootReducer middlewares:(NSArray<RxMiddleware>*)middlewares {
    self = [super init];
    if(!self) {
        return self;
    }
    
    _isDispatching = NO;
    _reducer = rootReducer;
    _state = rootState;
    _subscriptions = [NSMutableArray array];
    
    __weak RxStore *w = self;
    RxDispatchFunction defaultDispatch = ^id(id<RxAction> action) {
        __strong RxStore *this = w;
        if(this.isDispatching) {
            NSAssert(0, nil);
        }
        this.isDispatching = YES;
        id newState = this.reducer(action, this.state);
        this.isDispatching = NO;
        
        _state = newState;
        [this onStateChanged];
        return action;
    };
    
    RxGetState getState = ^id<RxState>() {
        __strong RxStore *this = w;
        return this.state;
    };
    
    RxDispatchFunction retryDispatch = ^id(id<RxAction> action) {
        __strong RxStore *this = w;
        return [this dispatch:action];
    };
    
    self.dispatchFunction = middlewares.reverse.reduce(defaultDispatch, ^id(RxDispatchFunction df, RxMiddleware mw){
        return mw([retryDispatch copy], [getState copy])(df);
    });
    
    if(self.state == nil) {
        [self dispatch:[[RxInitAction alloc] init]];
    }
    
    return self;
}

- (void) subscribe:(id<RxSubscriber>)subscriber {
    [self subscribe:subscriber withStateSelector:nil];
}

- (void) subscribe:(id<RxSubscriber>)subscriber withStateSelector:(RxStateSelector)stateSelector {
    if([self isNewSubscriber:subscriber]) {
        RxSubscription *sub = [[RxSubscription alloc] init];
        sub.subscriber = subscriber;
        sub.stateSelector = stateSelector;
        [self.subscriptions addObject:sub];
    }
    if(self.state) {
        [subscriber onStateChanged:stateSelector?stateSelector(self.state) : self.state];
    }
}

- (void) unsubscribe:(id<RxSubscriber>)subscriber {
    RxSubscription *sub = [self subscriptionWithSubscriber:subscriber];
    [self.subscriptions removeObject:sub];
}

- (id) dispatch:(id<RxAction>)action {
    return self.dispatchFunction(action);
}

#pragma mark - PRIVATE

- (BOOL) isNewSubscriber:(id<RxSubscriber>)subscriber {
    return [self subscriptionWithSubscriber:subscriber] == nil;
}

- (RxSubscription*) subscriptionWithSubscriber:(id<RxSubscriber>)subscriber {
    for (RxSubscription *sub in self.subscriptions) {
        if(sub.subscriber == subscriber) {
            return sub;
        }
    }
    return nil;
}

- (void) onStateChanged {
    for(RxSubscription *sub in self.subscriptions) {
        if(sub.subscriber) {
            id<RxState> state = sub.stateSelector? sub.stateSelector(self.state) : self.state;
            [sub.subscriber onStateChanged:state];
        }
    }
}

@end
