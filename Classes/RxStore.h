//
//  RxStore.h
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RxReducer.h"
#import "RxAction.h"
#import "RxState.h"
#import "RxSubscriber.h"
#import "RxMiddleware.h"

@protocol RxStore;


typedef id<RxState> (^RxStateSelector)(id<RxState> state);


@protocol RxStore <NSObject>

@property (strong, nonatomic, readonly) id<RxState> state;

- (instancetype) initWithState:(id<RxState>)rootState reducer:(RxReducer)rootReducer;
- (instancetype) initWithState:(id<RxState>)rootState reducer:(RxReducer)rootReducer middlewares:(NSArray<RxMiddleware>*)middlewares;

- (void) subscribe:(id<RxSubscriber>)subscriber;
- (void) subscribe:(id<RxSubscriber>)subscriber withStateSelector:(RxStateSelector)stateSelector;
- (void) unsubscribe:(id<RxSubscriber>)subscriber;

- (id) dispatch:(id<RxAction>)action;

@end




@interface RxStore : NSObject <RxStore>
@property (strong, nonatomic, readonly) id<RxState> state;
@end
