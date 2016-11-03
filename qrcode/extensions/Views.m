//
//  Views.m
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import "Views.h"

@implementation UIView(vim)

-(void)addshadow{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 0.4;
    self.layer.shadowOffset = CGSizeMake(1, 1);
}

-(CGPoint)origin{
    return CGPointMake(self.frame.origin.x, self.frame.origin.y);
}
-(void)setOrigin:(CGPoint)origin{
    CGRect rect = self.frame;
    rect.origin.x = origin.x;
    rect.origin.y = origin.y;
    self.frame = rect;
}

-(CGFloat)originX{
    return self.frame.origin.x;
}
-(void)setOriginX:(CGFloat)originX{
    CGRect rect = self.frame;
    rect.origin.x = originX;
    self.frame = rect;
}

-(CGFloat)originY{
    return self.frame.origin.y;
}
-(void)setOriginY:(CGFloat)originY{
    CGRect rect = self.frame;
    rect.origin.y = originY;
    self.frame = rect;
}

-(CGFloat)height{
    return  self.bounds.size.height;
}
-(void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

-(CGFloat)width{
    return  self.bounds.size.width;
}
-(void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

-(CGFloat)acumulatedWidth{
    return  self.width + self.frame.origin.x;
}
-(CGFloat)acumulatedHeight{
    return self.height + self.frame.origin.y;
}

-(CGPoint)centerBounds{
    return CGPointMake(self.width/2, self.height/2);
}


-(CGFloat)centerY{
    return self.center.x;
}
-(void)setCenterY:(CGFloat)centerX{
    CGPoint cen = self.center;
    cen.y = centerX;
    self.center = cen;
}

-(CGFloat)centerX{
    return self.center.x;
}
-(void)setCenterX:(CGFloat)centerX{
    CGPoint cen = self.center;
    cen.x = centerX;
    self.center = cen;
}

-(void)roundedStyle{
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
}

@end
