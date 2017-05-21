//
//  HJ_TitleButton.m
//  ScrollViewCutChildView
//
//  Created by MrHuang on 17/5/20.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJ_TitleButton.h"

@implementation HJ_TitleButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted{

}
@end
