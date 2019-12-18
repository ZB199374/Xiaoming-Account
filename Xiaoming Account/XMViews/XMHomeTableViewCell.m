//
//  HomeTableViewCell.m
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import "XMHomeTableViewCell.h"
#import "UIView+Extension.h"
@implementation XMHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFrame:(CGRect)frame
{
    frame.origin.y += 5;//这里间距为10，可以根据自己的情况调整
    frame.size.height -= 5;
    frame.origin.x += 3;
    frame.size.width -= 6;
    [super setFrame:frame];
}

@end
