//
//  BYThreeViewController.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYThreeViewController.h"

@interface BYThreeViewController ()

@end

@implementation BYThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Three";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
