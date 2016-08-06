//
//  RTAppReducer.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTAppReducer.h"

#import "RTAppState.h"
#import "RTCounterState.h"

#import "RTCounterReducer.h"


RxReducer RTAppReducer = ^id<RxState>(id<RxAction>action, RTAppState *state) {
    return [RTAppState stateWithCounter: RTCounterReducer(action, state)];
};
