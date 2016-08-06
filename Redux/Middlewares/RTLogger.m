//
//  RTLogger.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "RTLogger.h"

RxMiddleware RTActionLogger = ImplementMiddleware({
    printf("\nACTION %s\n", [action description].UTF8String);
    next(action);
    return action;
})


RxMiddleware RTStateLogger = ImplementMiddleware({
    next(action);
    printf("\nSTATE %s\n", [getState() description].UTF8String);

    return action;
})