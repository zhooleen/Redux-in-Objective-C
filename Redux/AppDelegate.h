//
//  AppDelegate.h
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Redux.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic, readonly) RxStore *store;

@end

FOUNDATION_EXTERN RxStore* MainStore;

FOUNDATION_EXTERN UIWindow* MainWindow;