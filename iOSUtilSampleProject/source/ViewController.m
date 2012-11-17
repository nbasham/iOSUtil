#import "ViewController.h"
#import "CaptureView.h"
#import "EmailController.h"
#import "ShareController.h"

@interface ViewController () {
    EmailController* emailController;
}
@end

@implementation ViewController

#pragma mark - EmailController
#pragma mark - CaptureView
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
    emailController = [[EmailController alloc] init];
    emailController.subject = @"Image example";
    emailController.isHTML = NO;
    emailController.body = @"Enclosed is an image.";
    UIImage* screenshotImage = [CaptureView viewToImage:self.view];
    [emailController attachImage:screenshotImage];
    [emailController addRecipient:@"steve@mac.com"];
    [emailController sendEmail:self];
}

#pragma mark - ShareController
- (IBAction)shareCrazyHorseTouch:(id)sender {
    [self showCrazyHorse];
}

- (IBAction)shareTheBandTouch:(id)sender {
    [self showTheBand];
}

-(void)showCrazyHorse {
    NSArray* items = @[@"ShareController example", [UIImage imageNamed:@"crazyHorse.png"]];
    [ShareController showFromParent:self items:items];
}

-(void)showTheBand {
    NSArray* items = @[@"ShareController example", [UIImage imageNamed:@"theBand.jpg"]];
    NSArray* excludes = @[UIActivityTypeCopyToPasteboard];
    [ShareController showFromParent:self items:items excludes:excludes callback:^(NSString* activityType, BOOL performedService) {
        if(activityType == nil) {
            NSLog(@"%@", @"Share panel was dismissed by user.");
        } else {
            NSLog(@"%@ was %@.", activityType, performedService ? @"performed" : @"cancelled");
        }
    }];
}

@end
