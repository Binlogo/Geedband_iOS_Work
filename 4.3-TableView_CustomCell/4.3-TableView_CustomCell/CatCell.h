//
//  CatCell.h
//  4.3-TableView_CustomCell
//
//  Created by binglogo on 15/10/11.
//  Copyright © 2015年 Binboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *masterNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
