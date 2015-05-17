//
//  LeveyPopListViewCell.m
//  LeveyPopListViewDemo
//
//  Created by Levey on 2/21/12.
//  Copyright (c) 2012 Levey. All rights reserved.
//

#import "LeveyPopListViewCell.h"

@implementation LeveyPopListViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.gImgView = [[UIImageView alloc]initWithFrame:CGRectMake(200,14, 15, 15)];
        self.gImgView.image = [UIImage imageNamed:@"button_single_unselect.png"];
        self.gImgView.hidden =YES;
        [self addSubview:self.gImgView];
        self.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15.];
        self.textLabel.numberOfLines = 2;
        self.textLabel.minimumFontSize = 11;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectOffset(self.imageView.frame, 6, 0);
    self.textLabel.frame = CGRectOffset(self.textLabel.frame, 6, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
