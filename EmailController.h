//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface EmailController : NSObject<MFMailComposeViewControllerDelegate>

@property(strong, nonatomic)NSData* attachment;
@property(strong, nonatomic)NSMutableArray* recipients;
@property(strong, nonatomic)NSString* subject;
@property(strong, nonatomic)NSString* body;
@property(strong, nonatomic)NSString* mimeType;
@property(strong, nonatomic)NSString* attachmentName;
@property(assign, nonatomic)BOOL isHTML;
@property(assign, nonatomic)BOOL logResult;

-(void)addRecipient:(NSString*)recipient;
-(void)attachImage:(UIImage*)image;
-(void)attachViewScreenshot:(UIView*)v;
-(void)sendEmail:(UIViewController*)vc;

@end
