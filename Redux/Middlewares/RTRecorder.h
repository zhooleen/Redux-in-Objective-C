//
//  RTRecorder.h
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Redux.h"
#import "Macros.h"

FOUNDATION_EXTERN RxMiddleware RTRecorder;


@interface RTActionContainer : NSObject

@property(strong, nonatomic, readonly) NSArray *actions;

+ (instancetype) sharedContainer;

@end