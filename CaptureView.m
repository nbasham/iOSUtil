//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import "CaptureView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CaptureView

+(UIImage*)viewToImage:(UIView*)v {
    CGFloat deviceMainScreenScale = 0.0;
    BOOL optimizationExcludeAlpha = NO;
    UIGraphicsBeginImageContextWithOptions(v.bounds.size, optimizationExcludeAlpha, deviceMainScreenScale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	return image;
}

+(NSData*)viewToPdf:(UIView*)v {
    NSMutableData* pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData, v.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    [v.layer renderInContext:pdfContext];
    UIGraphicsEndPDFContext();
    return pdfData;
}

@end
