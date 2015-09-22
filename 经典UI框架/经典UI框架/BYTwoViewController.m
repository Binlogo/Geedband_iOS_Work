//
//  BYTwoViewController.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYTwoViewController.h"

@interface BYTwoViewController ()

@end

@implementation BYTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Two";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bgImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
