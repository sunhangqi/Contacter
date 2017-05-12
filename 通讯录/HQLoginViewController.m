//
//  HQLoginViewController.m
//  通讯录
//
//  Created by Macbook on 2017/5/9.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "HQContactViewController.h"

@interface HQLoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *repwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation HQLoginViewController
- (IBAction)loginBtnClick:(UIButton *)sender {
    //提醒用户正在登陆
    [MBProgressHUD showMessage:@"正在登陆" toView:self.view];
    
    //延时执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //用户名，密码正确， 跳转到下一个界面
        if ([self.accountTextField.text isEqualToString:@"sun"] &&
            [self.pwdTextField.text isEqualToString:@"123"]) {
            //跳转到下一个界面， 手动执行线（Segue）
            [MBProgressHUD hideHUDForView:self.view];
            [self performSegueWithIdentifier:@"contactVC" sender:nil];
        }else{
//            NSLog(@"用户名或者密码错误");
            [MBProgressHUD hideHUDForView:self.view];
            [MBProgressHUD showError:@"用户名密码错误" toView:self.view];
        }
    });
    /**
     * performSegueWithIdentifier的底层实现
     1.到storyBoard当中去查找有没有给定标识的segue；
     2.根据制定的标识，Segue创建一个UIStoryboardSegue对象之后，把当前的控制器设置为它的源控制器；
     Sugue相当于一根线，一头是源控制器，另外一头是目标控制器
     3.UIStoryBoardSegue对象，再去创建它的目标控制器，给UIStoryboardSegue的目标控制器赋值；
     4.调用当前控制器prepareForSegue：方法，告诉用户，当前的线已经准备好了；
     5.底层调用[Segue perform]:实现
     [segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:YES];
  
     */
    
}
//准备跳转前调用
//传递数据：(顺序)
//1.数据接收的控制器定义一个属性， 来接收数据
//2.数据的来源控制器要拿到数据接收的控制器
//3.给接收的控制器的接收数据的属性给它赋值，执行属性的setter方法。
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HQContactViewController *contactVC = (HQContactViewController *)segue.destinationViewController;
    contactVC.accountName = self.accountTextField.text;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听账号跟密码同时有值得时候，让登录按钮可以点击
//    self.accountTextField.delegate = self;
//    self.pwdTextField.delegate = self;
    [self.accountTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.pwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //手动判断
    [self textChange];
    
    
}

//两个都有值得时候enable 按钮
- (void)textChange {
    self.loginBtn.enabled = self.accountTextField.text.length && self.pwdTextField.text.length;
}

- (IBAction)rePwdChange:(UISwitch *)sender {
    //当记住密码为No时，自动登录也是No
    if (self.repwdSwitch.on == NO) {
//        self.autoLoginSwitch.on = NO;
        //动画效果
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

- (IBAction)autoLoginChange:(UISwitch *)sender {
    if (self.autoLoginSwitch.on == YES) {
//        self.repwdSwitch.on = YES;
        //动画效果
        [self.repwdSwitch setOn:YES animated:YES];
    }
}

//如果使用代理模式，在第二行输入第一个值得时候，会先去判断上次返回值是否为YES，如果是YES，才会允许第二行值更改，因此只有输入到
//第二个字母的时候，判断才为真，因此用代理的方法会存在问题。
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (self.accountTextField.text.length && self.pwdTextField.text.length) {
//        self.loginBtn.enabled = YES;
//    }else{
//        self.loginBtn.enabled = NO;
//    }
//    
//    return YES;
//}
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
