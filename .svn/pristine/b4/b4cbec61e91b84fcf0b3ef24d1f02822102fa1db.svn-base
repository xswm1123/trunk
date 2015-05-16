

#import "MCProgressBarView.h"

@implementation MCProgressBarView {
    UIImageView * _backgroundImageView;
    UIImageView * _foregroundImageView;
    CGFloat minimumForegroundWidth;
    CGFloat availableWidth;
}

- (id)initWithFrame:(CGRect)frame backgroundImage:(UIImage *)backgroundImage foregroundImage:(UIImage *)foregroundImage
{
    self = [super initWithFrame:frame];
    if (self) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.image = backgroundImage;
        [self addSubview:_backgroundImageView];
        
        _foregroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _foregroundImageView.image = foregroundImage;
        [self addSubview:_foregroundImageView];
        
        UIEdgeInsets insets = foregroundImage.capInsets;
        minimumForegroundWidth = insets.left + insets.right;
        
        availableWidth = self.bounds.size.width - minimumForegroundWidth;
        
        self.progress = 0.5;
        self.left_valueLabel=[[UILabel alloc]init];

        
        self.left_nameLabel=[[UILabel alloc]init];

        
        self.right_nameLabel=[[UILabel alloc]init];

        
        self.right_valueLabel=[[UILabel alloc]init];
        
        self.housePercentLabel=[[UILabel alloc]init];
        self.moneyPercentLabel=[[UILabel alloc]init];
        
        
        [self insertSubview:self.left_nameLabel aboveSubview:_foregroundImageView];
        [self insertSubview:self.left_valueLabel aboveSubview:_foregroundImageView];
        [self insertSubview:self.right_nameLabel aboveSubview:_foregroundImageView];
        [self insertSubview:self.right_valueLabel aboveSubview:_foregroundImageView];
        [self insertSubview:self.housePercentLabel aboveSubview:_foregroundImageView];
        [self insertSubview:self.moneyPercentLabel aboveSubview:_foregroundImageView];
        
    }
    return self;
}
-(void)configLabelWithLeftName:(NSString*)Lname leftValue:(NSString*)Lvalue rightName:(NSString*)Rname rightValue:(NSString*)Rvalue  labelFont:(UIFont*)font LlabelTextColor:(UIColor*) Lcolor RlabelTextColor:(UIColor*) Rcolor{
    
    self.left_valueLabel.font=font;
    self.left_valueLabel.textColor=Lcolor;
    self.left_valueLabel.text=Lvalue;
    
    self.left_nameLabel.font=font;
    self.left_nameLabel.textColor=Lcolor;
    self.left_nameLabel.text=Lname;
   
    self.right_nameLabel.font=font;
    self.right_nameLabel.textColor=Rcolor;
    self.right_nameLabel.text=Rname;
   
    self.right_valueLabel.font=font;
    self.right_valueLabel.textColor=Rcolor;
    self.right_valueLabel.text=Rvalue;
}
- (void)setProgress:(double)progress
{
    _progress = progress;
    
    CGRect frame = _foregroundImageView.frame;
    frame.size.width = roundf(minimumForegroundWidth + availableWidth * progress);
    _foregroundImageView.frame = frame;
}

@end
