#import "EmailController.h"
#import <QuartzCore/QuartzCore.h>

@implementation EmailController

@synthesize attachment;
@synthesize attachmentName;
@synthesize recipients;
@synthesize subject;
@synthesize body;
@synthesize isHTML;
@synthesize logResult;

- (id)init {
    self = [super init];
    if (self) {
        attachment = nil;
        attachmentName = @"email attachment";
        recipients = [NSMutableArray array];
        subject = nil;
        body = nil;
        isHTML = YES;
        logResult = YES;
    }
    return self;
}

-(void)addRecipient:(NSString*)recipient {
    [recipients addObject:recipient];
}

-(void)attachImage:(UIImage*)image {
    self.attachment = [NSData dataWithData:UIImagePNGRepresentation(image)];
    self.mimeType = @"image/png";
}

-(void)attachViewScreenshot:(UIView*)v {
    CGFloat deviceMainScreenScale = 0.0;
    BOOL optimizationExcludeAlpha = NO;
    UIGraphicsBeginImageContextWithOptions(v.bounds.size, optimizationExcludeAlpha, deviceMainScreenScale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self attachImage:image];
}

-(void)sendEmail:(UIViewController*)vc {
    @try {
        MFMailComposeViewController* picker = [[MFMailComposeViewController alloc] init];
        picker.mailComposeDelegate = (id<MFMailComposeViewControllerDelegate>)self;
        [picker setSubject:self.subject];
        [picker setMessageBody:self.body isHTML:YES];
        [picker setToRecipients:self.recipients];
        if(self.attachment != nil) {
            [picker addAttachmentData:self.attachment mimeType:self.mimeType fileName:self.attachmentName];
        }
        [vc presentModalViewController:picker animated:YES];
    }
    @catch (NSException* e) {
        if(self.logResult) {
            NSLog(@"sendEmail failed.");
        }
    }
}

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [controller dismissModalViewControllerAnimated:YES];
    NSString* resultStr = @"unknow email response";
    switch (result) {
        case MFMailComposeResultCancelled:
            resultStr = @"Email composer reports user canceled.";
            break;
        case MFMailComposeResultSaved:
            resultStr = @"Email composer reports user saved";
            break;
        case MFMailComposeResultSent:
            //  doesn't appear to be away to get sent parts e.g. recipients and body
            resultStr = @"Email composer reports user sent.";
            break;
        case MFMailComposeResultFailed:
            resultStr = [NSString stringWithFormat:@"Email composer reports email failed. Error %@", [error description]];
            break;
    }
    if(self.logResult) {
        NSLog(@"%@", resultStr);
    }
}

@end
