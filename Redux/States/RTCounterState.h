//
//  RTCounterState.h
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Redux.h"

@interface RTCounterState : NSObject <RxState>

@property (assign, nonatomic, readonly) NSInteger counter;

- (instancetype) initWithCounter:(NSInteger)counter;

@end


@protocol RTHasCounterState <RxState>

@property (strong, nonatomic, readonly) RTCounterState *counterState;

@end
