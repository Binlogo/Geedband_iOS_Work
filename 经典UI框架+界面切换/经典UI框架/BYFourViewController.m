//
//  BYFourViewController.m
//  经典UI框架
//
//  Created by binglogo on 15/9/10.
//  Copyright (c) 2015年 Binboy. All rights reserved.
//

#import "BYFourViewController.h"

@interface BYFourViewController ()

@end

@implementation BYFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Four";
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:bgImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
