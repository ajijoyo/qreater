//
//  Dates.h
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(dat)

/**
 shortcut nsdate to string with format

 @param str format nsdate 'dd MM YYYY'
 
 @return string nsdate with format
 */
-(NSString*)stringFormat:(NSString*)str;

@end
