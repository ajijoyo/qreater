//
//  Dates.m
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import "Dates.h"

@implementation NSDate(dat)

-(NSString*)stringFormat:(NSString*)str{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:str];
    return [format stringFromDate:self];
}

@end
