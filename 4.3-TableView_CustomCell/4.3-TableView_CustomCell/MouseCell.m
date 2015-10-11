//
//  MouseCell.m
//  4.3-TableView_CustomCell
//
//  Created by binglogo on 15/10/11.
//  Copyright © 2015年 Binboy. All rights reserved.
//

#import "MouseCell.h"

@implementation MouseCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
