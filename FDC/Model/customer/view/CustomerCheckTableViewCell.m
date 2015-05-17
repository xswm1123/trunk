//
//  CustomerCheckTableViewCell.m
//  FDC
//
//  Created by NewDoone on 15/2/2.
//  Copyright (c) 2015年 wlpiaoyi. All rights reserved.
//

#import "CustomerCheckTableViewCell.h"

@implementation CustomerCheckTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setSex:(NSString *)sex{
    _sex=sex;
    if ([sex isEqualToString:@"女"]) {
        self.photoIV.image=[UIImage imageNamed:@"female.png"];
    }else{
        self.photoIV.image=[UIImage imageNamed:@"male.png"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
