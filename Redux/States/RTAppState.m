//
//  RTAppState.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTAppState.h"

@implementation RTAppState

+ (instancetype) stateWithCounter:(RTCounterState*)counter {
    return [[RTAppState alloc] initWithCounter:counter];
}

- (instancetype) initWithCounter:(RTCounterState*)counter {
    self = [super init];
    if(self) {
        _counterState = counter;
    }
    return self;
}


@end
