iOSUtil
=======
<ul>
		<li>CaptureView - creates a PDF or UIImage screenshot from a UIView.</li>
		<li>DelimitedFile - creates an array of user defined objects from a delimited file.</li>
		<li>EmailController - a simple way to send email from a UIViewController.</li>
		<li>ShareController - a simple way to share items via Facebook, Twitter, Weibo, Message, Mail, Print, Copy to Pasteboard, Assign to Contacts, and Save to Camera Roll.</li>
</ul>

<h2><b>CaptureView</b></h2> 
> 
>     NSData* pdfData = [CaptureView viewToPdf:self.view];
>     UIImage* screenshotImage = [CaptureView viewToImage:self.view];
> 
> See ViewController.m in sample project for examples.

<h2><b>DelimitedFile</b></h2> 

> <b>Example:</b> Creates an array of user defined objects populated with a tab separated file. In this example, objects of type Band are created from file "data.tsv":
> 
>     NSArray* bands = [DelimitedFile load:@"data.tsv" toClass:[Band class] delimeter:kTabDelimeter];
> 
> <b>Band.h</b>

> 		@interface Band : NSObject<DelimitedFileDelegate>
> 		@property(nonatomic, assign)int uid;
> 		@property(nonatomic, strong)NSString* name;
> 		@property(nonatomic, strong)NSArray* members;
> 
> <b>Band.m</b>
> 
	-(void)fromValues:(NSArray*)tsv {
		self.uid = [[tsv objectAtIndex:0] intValue];
		self.name = [tsv objectAtIndex:1];
		self.members = [[tsv objectAtIndex:2] componentsSeparatedByString:@","];
	}
> 
> <b>"data.tsv"</b>
> <table>
>     <tr>
>         <td>1</td>
>         <td>Crazy Horse</td>
>         <td>Billy,Pancho,Ralph,Neil,Danny</td>
>     </tr>
>     <tr>
>         <td>2</td>
>         <td>The Band</td>
>         <td>Rick,Levon,Garth,Richard,Robbie,Jim,Stan,Randy,Richard</td>
>     </tr>
> </table>
> 
> 
> Full implementation in sample project. Similarly, you can do the same with any delimiter e.g. comma separated (CSV) files (see sample project). 

> <b>Questions:</b>
> <ul>
> 		<li>Is there a real world case for using a NSCharacterSet instead of a char delimiter?</li>
> 		<li>Should fromValues return a BOOL allowing filtering of some objects from the array?</li>
> </ul>

<h2><b>EmailController</b></h2> 

> <b>Note:</b> Requires MessageUI.framework

> <b>Example 1:</b> The snippet below displays Apple's mail composer
> 
>     emailController = [[EmailController alloc] init];
>     [emailController sendEmail:self];
> 
> <b>Example 2:</b> The snippet below emails a screenshot of the current UIViewController with an HTML body.
> 
>     emailController = [[EmailController alloc] init];
>     emailController.attachmentName = @"screenshot.png";
>     emailController.subject = @"Image example";
>     emailController.isHTML = YES;
>     emailController.body = @"Enclosed is an <b>image</b>.";
>     UIImage* screenshotImage = [CaptureView viewToImage:self.view];
>     [emailController attachImage:screenshotImage];
>     [emailController addRecipient:@"steve@mac.com"];
>     [emailController sendEmail:self];
> 
> See ViewController.m in sample project for examples. The reference to emailController must be retained for the life span of the email composer.
> 
> <b>Optional Properties</b>
> <table>
>     <tr>
>         <td>NSData* attachment</td>
>         <td>NSData to be attached to email.</td>
>     </tr>
>     <tr>
>         <td>NSMutableArray* recipients</td>
>         <td>Array of recipients, instantiated in init.</td>
>     </tr>
>     <tr>
>         <td>NSString* subject</td>
>         <td>Text to appear as email's subject.</td>
>     </tr>
>     <tr>
>         <td>NSString* body</td>
>         <td>The default body of the email. This value can be changed by user.</td>
>     </tr>
>     <tr>
>         <td>NSString* mimeType</td>
>         <td>The attachment mime type.</td>
>     </tr>
>     <tr>
>         <td>NSString* attachmentName</td>
>         <td>The name of the attachment, this is visible to the user.</td>
>     </tr>
>     <tr>
>         <td>BOOL isHTML</td>
>         <td>Defaults to YES. Treat body as HTML.</td>
>     </tr>
>     <tr>
>         <td>BOOL logResult</td>
>         <td>Send log info to console.</td>
>     </tr>
> </table>

<h2><b>ShareController</b></h2> 

> <b>Note:</b> Requires Social.framework linked as 'optional'. Requires iOS 6, previous iOS versions display an alert.

> <b>Example 1:</b> The snippet below displays an image Apple's share panel
> 
>     NSArray* items = @[@"ShareController example", [UIImage imageNamed:@"crazyHorse.png"]];
>     [ShareController showFromParent:self items:items];
> 
> <b>Example 2:</b> The snippet below displays an image Apple's share panel without the UIActivityTypeCopyToPasteboard service. It also demonstrates using a callback.
> 
>     NSArray* excludes = @[UIActivityTypeCopyToPasteboard];
>     [ShareController showFromParent:self items:items excludes:excludes callback:^(NSString* activityType, BOOL performedService) {
>         if(activityType == nil) {
>             NSLog(@"%@", @"Share panel was dismissed by user.");
>         } else {
>             NSLog(@"%@ was %@.", activityType, performedService ? @"performed" : @"cancelled");
>         }
>     }];
