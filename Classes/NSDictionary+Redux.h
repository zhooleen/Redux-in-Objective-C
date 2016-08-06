//
//  NSDictionary+Redux.h
//  Redux
//
//  Created by lzhu on 8/6/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RxAction.h"

@interface NSDictionary (Redux) <RxAction>
@property (strong, nonatomic, readonly) NSString *type;
@end
