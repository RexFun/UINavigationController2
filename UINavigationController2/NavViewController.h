//
//  NavViewController.h
//  UINavigationController2
//
//  Created by mac373 on 16/1/21.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView.h"

@interface RootViewController : UITableViewController

@property (nonatomic, strong) UITableView *navSectionView;
@property (nonatomic, strong) NSArray *navSectionList;

@end
