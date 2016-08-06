//
//  ViewController.m
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "ViewController.h"

#import "NSArray+Redux.h"
#import "RTAppState.h"
#import "Redux.h"
#import "AppDelegate.h"
#import "RTCounterAction.h"
#import "NSDictionary+Redux.h"

@interface ViewController () <RxSubscriber>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MainStore subscribe:self withStateSelector:^id<RxState>(RTAppState *state) {
        return state.counterState;
    }];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MainStore unsubscribe:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onStateChanged:(RTCounterState*)state {
    self.label.text= [@(state.counter) stringValue];
}

- (IBAction)decr:(id)sender {
    [MainStore dispatch:@{@"type":RTCounterDecrActionType}];
}

- (IBAction)incr:(id)sender {
    [MainStore dispatch:@{@"type":RTCounterIncrActionType}];
}

@end
