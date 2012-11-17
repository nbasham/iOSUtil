//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import "ShareController.h"

#define kUseBuiltInActivities nil

@implementation ShareController

+(BOOL)canShow {
    if([UIActivityViewController class] != nil) {
        return YES;
    }
    return NO;
}

+(void)showFromParent:(UIViewController*)parent items:(NSArray*)items {
    [ShareController showFromParent:parent items:items excludes:nil callback:nil];
}

+(void)showFromParent:(UIViewController*)parent items:(NSArray*)items excludes:(NSArray*)excludes callback:(UIActivityViewControllerCompletionHandler)callback {
    if([ShareController canShow]) {
        UIActivityViewController* vc = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:kUseBuiltInActivities];
        vc.excludedActivityTypes = excludes;
        vc.completionHandler = callback;
        [parent presentViewController:vc animated:YES completion:nil];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:@"Sharing requires iOS 6" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
