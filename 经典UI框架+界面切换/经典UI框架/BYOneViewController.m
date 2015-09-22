//
//  BYOneViewController.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYOneViewController.h"

@interface BYOneViewController ()

@end

@implementation BYOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"One";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgImageView];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pushButton.frame = CGRectMake(10, 74, self.view.bounds.size.width - 20, 44);
    [pushButton setBackgroundColor:[UIColor purpleColor]];
    [pushButton setTitle:@"Push A View" forState:UIControlStateNormal];
    [pushButton addTarget:self
                   action:@selector(pushButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    presentButton.frame = CGRectMake(10, 150, self.view.bounds.size.width - 20, 44);
    [presentButton setBackgroundColor:[UIColor blueColor]];
    [presentButton setTitle:@"Present A View" forState:UIControlStateNormal];
    [presentButton addTarget:self
                   action:@selector(presentButtonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
}

#pragma mark - Custom Event Methods

- (void)pushButtonClicked:(id)sender {
    UIViewController *pusedViewController = [[UIViewController alloc] init];
    [self.navigationController pushViewController:pusedViewController animated:YES];
}

- (void)presentButtonClicked:(id)sender {
    UIViewController *presentedViewController = [[UIViewController alloc] init];
    presentedViewController.view.backgroundColor = [UIColor blackColor];
    [self presentViewController:presentedViewController animated:YES completion:^{
        [presentedViewController dismissViewControllerAnimated:presentedViewController completion:nil];
    }];
}

#pragma mark - Memory Management Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
