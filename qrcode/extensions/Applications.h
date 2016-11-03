//
//  Applications.h
//  qrcode
//
//  Created by ajiejoy on 11/3/16.
//  Copyright © 2016 prototype. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIApplication(top)

/**
 get current root viewcontroller

 @return uiviewcontroller
 */
+(UIViewController*)topController;

+ (NSString *) build;
+ (NSString *) appVersion;
+ (NSString *) versionBuild;

//+(void)openNotification:(NSDictionary*)info;

@end
