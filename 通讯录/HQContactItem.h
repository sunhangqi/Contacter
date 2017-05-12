//
//  HQContactItem.h
//  通讯录
//
//  Created by Macbook on 2017/5/12.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQContactItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phone;





+ (instancetype)itemWithName:(NSString *)name phone:(NSString *)phone;

@end
