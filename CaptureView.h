#import <UIKit/UIKit.h>

@interface CaptureView : NSObject {
}

+(UIImage*)viewToImage:(UIView*)v;
+(NSData*)viewToPdf:(UIView*)aView;

@end
