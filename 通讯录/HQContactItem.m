//
//  HQContactItem.m
//  通讯录
//
//  Created by Macbook on 2017/5/12.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQContactItem.h"

@implementation HQContactItem


+ (instancetype)itemWithName:(NSString *)name phone:(NSString *)phone {
    HQContactItem *item = [[HQContactItem alloc] init];
    item.name = name;
    item.phone = phone;
    return item;
}

@end
