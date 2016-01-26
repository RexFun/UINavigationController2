//
//  NavViewController.h
//  UINavigationController2
//
//  Created by mac373 on 16/1/21.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewCell.h"
#import "SecondViewController.h"

@interface RootViewController : UITableViewController

@property (nonatomic, strong) NSArray *navRowList;
@property (nonatomic, strong) SecondViewController *secondViewController;

@end
