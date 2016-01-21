//
//  NavViewCell.m
//  UINavigationController2
//
//  Created by mac373 on 16/1/21.
//  Copyright © 2016年 ole. All rights reserved.
//

#import "RootViewCell.h"

@implementation RootViewCell

@synthesize sectionName;

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"Cell";
    // 1.缓存中取
    RootViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[RootViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //name
        self.sectionName = [[UILabel alloc] init];
        [self.contentView addSubview:self.sectionName];
    }
    return self;
}

/**
 设置Cell
 */
- (void)setWithName:(NSString *)name {
    self.sectionName.frame = CGRectMake(80, 25, 200, 30);
    self.sectionName.backgroundColor = [UIColor orangeColor];
    self.sectionName.textColor = [UIColor blackColor];
    self.sectionName.text = name;
    [self.contentView addSubview:sectionName];
}

@end
