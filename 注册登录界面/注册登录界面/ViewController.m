//
//  ViewController.m
//  注册登录界面
//
//  Created by binglogo on 15/9/22.
//  Copyright © 2015年 Binboy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIImageView *loginImage;
@property (strong, nonatomic) UILabel *accountLabel, *passwordLabel;
@property (strong, nonatomic) UITextField *accountTextField, *passwordTextField;
@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.创建UIImageView显示头像
    self.loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(160, 140, 57, 57)];
    [self.loginImage setImage:[UIImage imageNamed:@"Icon"]];
    [self.view addSubview:self.loginImage];
    //2.创建账号密码提示标签
    self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 225, 72, 30)];
    [self.accountLabel setText:@"账号:"];
    self.passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 265, 72, 30)];
    [self.passwordLabel setText:@"密码:"];
    [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.passwordLabel];
    //3.创建账号密码输入框
    self.accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 225, 155, 30)];
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 265, 155, 30)];
    self.passwordTextField = passwordTextField;
    [self.accountTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [passwordTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:passwordTextField];
    //4.创建登陆按钮
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(152, 320, 72, 30)];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:self.loginButton];
    //5.添加登录点击事件
    [self.loginButton addTarget:self action:@selector(loginButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

//登录方法，点击事件
- (void)loginButtonPressed {
    UIAlertView *loginAlert;
    NSLog(@"%@,%@",self.accountTextField.text,self.passwordTextField.text);
    if (![self.accountTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""]) {
        if ([self.accountTextField.text isEqualToString:@"admin"] && [self.passwordTextField.text isEqualToString:@"admin"]) {
            loginAlert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"登录成功"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:nil];
            [loginAlert show];
            [self performSelector:@selector(dismissAlert:) withObject:loginAlert afterDelay:2.0];
        } else {
            loginAlert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"账户或密码错误"
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil];
            [loginAlert show];
        }
    } else {
        loginAlert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                message:@"账户密码不能为空"
                                               delegate:nil
                                      cancelButtonTitle:@"确定"
                                      otherButtonTitles:nil];
        [loginAlert show];
    }
    [self.view endEditing:YES];
}
//alert消失
- (void)dismissAlert:(UIAlertView *)alert {
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
