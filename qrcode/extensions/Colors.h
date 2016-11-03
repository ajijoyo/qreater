//
//  Colors.h
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor(extend)

@property(nonatomic,readonly) UIColor *lighterColor;

@property(nonatomic,readonly) UIColor *darkerColor;

-(UIColor *)alpha:(CGFloat)alpha;

+(UIColor*)R:(int)R G:(int)G B:(int)B;

+(UIColor*)R:(int)R G:(int)G B:(int)B A:(float)A;

/**
 Color With hex #ffffff and alpha 0.9
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString andAlpha:(CGFloat)A;

/**
 Color With hex #ffffff
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end
