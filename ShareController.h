//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import <Foundation/Foundation.h>

@interface ShareController : NSObject

+(BOOL)canShow;
+(void)showFromParent:(UIViewController*)parent items:(NSArray*)items;
+(void)showFromParent:(UIViewController*)parent items:(NSArray*)items excludes:(NSArray*)excludes callback:(UIActivityViewControllerCompletionHandler)callback;

@end
