//
//  Macros.h
//  Redux
//
//  Created by lzhu on 8/6/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INIT( STATEMENT )   \
- (instancetype ) init {    \
    self = [super init];    \
    if(self) {              \
        STATEMENT           \
    }                       \
    return self;            \
}


#define ImplementSingleton(NAME)        \
+ (instancetype) NAME {                 \
    static dispatch_once_t once;        \
    static id ret;                      \
    dispatch_once(&once, ^{             \
        ret = [[self class] new];       \
    });                                 \
    return ret;                         \
}
