#import "AppDelegate.h"
#import "DelimitedFile.h"
#import "Band.h"
#import "State.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray* bands = [DelimitedFile load:@"data.tsv" toClass:[Band class] delimeter:kTabDelimeter];
    NSLog(@"%@", [bands description]);
    NSArray* states = [DelimitedFile load:@"data.csv" toClass:[State class] delimeter:kCommaDelimeter];
    NSLog(@"%@", [states description]);
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
