//
//  HQAddContactController.h
//  通讯录
//
//  Created by Macbook on 2017/5/11.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQContactItem;
@class HQAddContactController;
//@class HQContactViewController;

@protocol HQAddContactControllerDelegate <NSObject>

- (void)addContactController:(HQAddContactController *)addContactController contactItem:(HQContactItem *)item;

@end

@interface HQAddContactController : UIViewController
//@property (nonatomic, strong) HQContactViewController *contactVC;
@property (nonatomic, weak) id<HQAddContactControllerDelegate> delegate;


@end
