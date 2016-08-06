//
//  ViewController.h
//  Redux
//
//  Created by lzhu on 8/4/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;


- (IBAction)decr:(id)sender;

- (IBAction)incr:(id)sender;

@end

