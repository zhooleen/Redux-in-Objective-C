//
//  RTRecorder.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTRecorder.h"

@interface RTActionContainer () {
    NSMutableArray *_actions;
}
@end



@implementation RTActionContainer
@synthesize actions = _actions;

ImplementSingleton(sharedContainer)
INIT(_actions = [NSMutableArray array];)

- (void) addAction:(id<RxAction>)action {
    [_actions addObject:action];
}

@end



RxMiddleware RTRecorder = ImplementMiddleware({
    [[RTActionContainer sharedContainer] addAction:action];
    next(action);
    return action;
})