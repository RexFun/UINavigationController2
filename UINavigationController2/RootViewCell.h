//
//  NavViewCell.h
//  UINavigationController2
//
//  Created by mac373 on 16/1/21.
//  Copyright © 2016年 ole. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *sectionName;

- (void)setWithName:(NSString *)name;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
