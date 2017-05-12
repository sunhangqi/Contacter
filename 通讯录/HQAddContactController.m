//
//  HQAddContactController.m
//  通讯录
//
//  Created by Macbook on 2017/5/11.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQAddContactController.h"
#import "HQContactItem.h"
#import "HQContactViewController.h"


@interface HQAddContactController () <HQAddContactControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation HQAddContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.nameTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.phoneTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //手动判断
    [self textChange];
    
//    NSLog(@"------%@",self.delegate);
}

//准备跳转前调用
//传递数据：(逆序)
//1.数据接收的控制器定义一个属性， 来接收数据
//2.数据的来源控制器要拿到数据接收的控制器
//3.给接收的控制器的接收数据的属性给它赋值，执行属性的setter方法。
- (IBAction)addBtnClick:(UIButton *)sender {
    //把输入的姓名电话传递到上一层
    //把姓名电话封装成模型
    HQContactItem *item = [HQContactItem itemWithName:self.nameTextField.text phone:self.phoneTextField.text];
//    self.contactVC.item = item;
    
    if([self.delegate respondsToSelector:@selector(addContactController:contactItem:)]) {
        [self.delegate addContactController:self contactItem:item];
    }
    
    
    
    //返回上一级
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
//- (void)addContactController:(HQAddContactController *)addContactController contactItem:(HQContactItem *)item {
//    
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)textChange {
    self.addBtn.enabled = self.nameTextField.text.length && self.phoneTextField.text.length;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
