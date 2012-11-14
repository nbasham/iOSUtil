#import "AppDelegate.h"
#import "DelimetedFile.h"
#import "Band.h"
#import "State.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray* bands = [DelimetedFile loadTSV:@"data.tsv" toClass:[Band class]];
    NSLog(@"%@", [bands description]);
    NSArray* states = [DelimetedFile loadCSV:@"data.csv" toClass:[State class]];
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
