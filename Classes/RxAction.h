//
//  RxAction.h
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RxAction <NSObject>

@property (strong, nonatomic, readonly) NSString *type;

@end





