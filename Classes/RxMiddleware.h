//
//  RxMiddleware.h
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RxAction;
@protocol RxState;

typedef id (^RxDispatchFunction)(id<RxAction> action);

typedef id<RxState> (^RxGetState)();

typedef RxDispatchFunction (^RxDispatchFunctionChain)(RxDispatchFunction);

typedef RxDispatchFunctionChain (^RxMiddleware)(RxDispatchFunction dispatchFunction, RxGetState getState);

#define ImplementMiddleware(SATEMENT)                                           \
^ RxDispatchFunctionChain (RxDispatchFunction function, RxGetState getState) {  \
    return ^RxDispatchFunction (RxDispatchFunction next) {                      \
        return ^id(id<RxAction> action) {                                       \
            SATEMENT                                                            \
        };                                                                      \
    };                                                                          \
};