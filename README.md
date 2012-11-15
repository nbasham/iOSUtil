iOSUtil
=======
	 • CaptureView - creates a PDF or UIImage screenshot from a UIView.
	 • DelimitedFile - creates an array of user defined objects from a tab or comma separated file.
	 • EmailController - a simple way to send email from a UIViewController.

<h2><b>CaptureView</b></h2> 
> 
>     NSData* pdfData = [CaptureView viewToPdf:self.view];
>     UIImage* screenshotImage = [CaptureView viewToImage:self.view];
> 
> See ViewController.m in sample project for examples.

<h2><b>DelimitedFile</b></h2> 

> <b>Example:</b> Given a class Band (full example in sample project):
> 
> 	@interface Band : NSObject<TabSeparatedFileDelegate>
> 	
> 	@property(nonatomic, assign)int uid;
> 	@property(nonatomic, strong)NSString* name;
> 	@property(nonatomic, strong)NSArray* members;
> 
> And the tab separated file named "data.tsv":
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
> <b>Code:</b> Creates an array of Band objects from the file above:
> 
>     NSArray* bands = [DelimitedFileDelimitedFile loadTSV:@"data.tsv" toClass:[Band class]];
> 
> Similarly, you can do the same with comma separated (CSV) files (see sample project). Adding one method will allow use of any delimiter.

<h2><b>EmailController</b></h2> 
> <b>Note:</b> Requires MessageUI.framework

> <b>Example:</b> The snippet below emails a screenshot of the current UIViewController
> 
>     UIImage* screenshotImage = [CaptureView viewToImage:self.view];
>     emailController = [[EmailController alloc] init];
>     [emailController attachImage:screenshotImage];
>     emailController.attachmentName = @"screenshot.png";
>     emailController.subject = @"Image example";
>     emailController.isHTML = NO;
>     emailController.body = @"Enclosed is an image.";
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
