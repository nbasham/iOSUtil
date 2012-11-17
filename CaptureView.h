//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import <UIKit/UIKit.h>

@interface CaptureView : NSObject {
}

+(UIImage*)viewToImage:(UIView*)v;
+(NSData*)viewToPdf:(UIView*)aView;

@end
