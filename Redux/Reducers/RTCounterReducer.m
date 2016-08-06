//
//  RTCounterReducer.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTCounterReducer.h"
#import "RTCounterState.h"
#import "RTCounterAction.h"

RxReducer RTCounterReducer = ^ id<RxState> (id<RxAction> action, id<RTHasCounterState> state) {
    if([state conformsToProtocol:@protocol(RTHasCounterState)]) {
        RTCounterState *counter = state.counterState;
        if(counter == nil) {
            counter = [[RTCounterState alloc] init];
        }
        if([action.type isEqualToString:RTCounterDecrActionType]) {
            return [[RTCounterState alloc] initWithCounter:counter.counter-1];
        } else if([action.type isEqualToString:RTCounterIncrActionType]) {
            return [[RTCounterState alloc] initWithCounter:counter.counter+1];
        }
    }
    return state;
};
