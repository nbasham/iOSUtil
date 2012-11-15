#import "ViewController.h"
#import "CaptureView.h"
#import "EmailController.h"

@interface ViewController () {
    EmailController* emailController;
}
@end

@implementation ViewController

- (IBAction)emailPdfTouch:(id)sender {
    NSData* pdfData = [CaptureView viewToPdf:self.view];
    emailController = [[EmailController alloc] init];
    emailController.attachment = pdfData;
    emailController.attachmentName = @"screenshot.pdf";
    emailController.mimeType = @"application/pdf";
    emailController.subject = @"PDF example";
    emailController.body = @"Enclosed is a <b>PDF!<b/>";    //  body defaults to HTML
    [emailController sendEmail:self];
}

- (IBAction)emailScreenshotTouch:(id)sender {
    UIImage* screenshotImage = [CaptureView viewToImage:self.view];
    emailController = [[EmailController alloc] init];
    [emailController attachImage:screenshotImage];
    emailController.subject = @"Image example";
    emailController.isHTML = NO;
    emailController.body = @"Enclosed is an image.";
    [emailController addRecipient:@"steve@mac.com"];
    [emailController sendEmail:self];
}

@end
