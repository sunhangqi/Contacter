//
//  HQContactViewController.h
//  通讯录
//
//  Created by Macbook on 2017/5/9.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQContactItem;

@interface HQContactViewController : UITableViewController

//当前用户名
@property (nonatomic, strong) NSString *accountName;

@property (nonatomic, strong) HQContactItem *item;

@end
