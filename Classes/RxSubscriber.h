//
//  RxSubscriber.h
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RxState;

@protocol RxSubscriber <NSObject>

- (void) onStateChanged:(id<RxState>)state;

@end
