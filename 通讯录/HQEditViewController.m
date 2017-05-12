//
//  HQEditViewController.m
//  通讯录
//
//  Created by Macbook on 2017/5/12.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQEditViewController.h"
#import "HQContactItem.h"

@interface HQEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation HQEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = self.item.name;
    self.phoneTextField.text = self.item.phone;
    // Do any additional setup after loading the view.
}
- (IBAction)editClick:(UIBarButtonItem *)sender {
    
    if([sender.title isEqualToString:@"编辑"]) {
        //电话文本成为第一响应者
        self.phoneTextField.enabled = YES;
        self.nameTextField.enabled = YES;
        [self.phoneTextField becomeFirstResponder];
        
        //保存按钮显示
        self.saveBtn.hidden = NO;
        
        //把编辑文字改为取消
        sender.title = @"取消";
    }else{
        self.phoneTextField.enabled = NO;
        self.nameTextField.enabled = NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        sender.title = @"编辑";
        
        //恢复之前的数据
        self.nameTextField.text = self.item.name;
        self.phoneTextField.text = self.item.phone;
    }
    
}
- (IBAction)saveBtnClick:(id)sender {
    
    //修改模型
    self.item.name = self.nameTextField.text;
    self.item.phone = self.phoneTextField.text;
    
    //通知上一个控制器刷新列表
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
    //返回上一级
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//- (void)setItem:(HQContactItem *)item {
//    _item = item;
//    
//    
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
