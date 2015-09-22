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
}

#pragma mark - Custom Event Methods

- (void)pushButtonClicked:(id)sender {
    
}

#pragma mark - Memory Management Methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
