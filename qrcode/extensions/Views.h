//
//  Views.h
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView(vim)

/**get height + Y*/
@property(nonatomic,readonly) CGFloat acumulatedHeight;
/**get width + X*/
@property(nonatomic,readonly) CGFloat acumulatedWidth;

@property(nonatomic,readonly) CGPoint centerBounds;

/**get shortcut bounds.size.height*/
@property(nonatomic,assign) CGFloat height;
/**get shortcut bounds.size.width*/
@property(nonatomic,assign) CGFloat width;
/**get shortcut frame.origin.x*/
@property(nonatomic,assign) CGFloat originX;
/**get shortcut frame.origin.y*/
@property(nonatomic,assign) CGFloat originY;
/** get n set shortcut center.x */
@property(nonatomic,assign) CGFloat centerX;
/** get n set shortcut center.y */
@property(nonatomic,assign) CGFloat centerY;

@property(nonatomic,assign) CGPoint origin;

-(void)roundedStyle;

-(void)addshadow;

@end

