//
//  RTCounterState.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTCounterState.h"

@implementation RTCounterState

- (instancetype) initWithCounter:(NSInteger)counter {
    self = [super init];
    if(self) {
        _counter = counter;
    }
    return self;
}

- (instancetype) init {
    return [self initWithCounter:0];
}

@end
