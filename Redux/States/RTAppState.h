//
//  RTAppState.h
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Redux.h"

#import "RTCounterState.h"


@interface RTAppState : NSObject <RxState, RTHasCounterState>

@property (strong, nonatomic, readonly) RTCounterState *counterState;

+ (instancetype) stateWithCounter:(RTCounterState*)counter;

@end
