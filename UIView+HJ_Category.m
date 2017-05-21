//
//  UIView+HJ_Category.m
//  ScrollViewCutChildView
//
//  Created by MrHuang on 17/5/20.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "UIView+HJ_Category.h"

@implementation UIView (HJ_Category)


-(CGSize)HJ_Size{

    return self.frame.size;
}

-(void)setHJ_Size:(CGSize )HJ_Size{
    
    CGRect frame = self.frame;
    frame.size = self.HJ_Size;
    self.frame = frame;
    
}

-(CGFloat)HJ_Width{
    
    return self.frame.size.width;
}

-(void)setHJ_Width:(CGFloat)HJ_Width{

    CGRect frame = self.frame;
    frame.size.width = HJ_Width;
    self.frame = frame;

}

-(CGFloat)HJ_Height{

    return self.frame.size.height;
}

-(void)setHJ_Height:(CGFloat)HJ_Height{

    CGRect frame = self.frame;
    frame.size.height = HJ_Height;
    self.frame = frame;
}
-(CGFloat)HJ_x{
    
    return self.frame.origin.x;
}

-(void)setHJ_x:(CGFloat)HJ_x{

    CGRect frame = self.frame;
    frame.origin.x = HJ_x;
    self.frame = frame;

}

-(CGFloat)HJ_y{
    
    return self.frame.origin.y;
}

-(void)setHJ_y:(CGFloat)HJ_y{

    CGRect frame = self.frame;
    frame.origin.y = HJ_y;
    self.frame = frame;
}

-(CGFloat)HJ_CenterX{
    
    return self.center.x;
}

-(void)setHJ_CenterX:(CGFloat)HJ_CenterX{

    CGPoint center = self.center;
    center.x = HJ_CenterX;
    self.center = center;
    
}

-(CGFloat)HJ_CenterY{
    
    return self.center.y;
}

-(void)setHJ_CenterY:(CGFloat)HJ_CenterY{
    
    CGPoint center = self.center;
    center.y = HJ_CenterY;
    self.center = center;
}

@end
