iOSUtil
=======

iOS Utilities - currently only one utility exists: DelimetedFile

DelimetedFile - creates an array of objects from a tab or separated file.

EXAMPLE:

    NSArray* bands = [DelimetedFile loadTSV:@"data.tsv" toClass:[Band class]];
    NSLog(@"%@", [bands description]);

2012-11-14 07:56:55.258 iOSUtil[82697:c07] (
    "1 Crazy Horse: Billy Pancho Ralph Neil Danny",
    "2 The Band: Rick Levon Garth Richard Robbie Jim Stan Randy Richard"
)

--- data.tsv
1	Crazy Horse	Billy,Pancho,Ralph,Neil,Danny
2	The Band	Rick,Levon,Garth,Richard,Robbie,Jim,Stan,Randy,Richard

--- Band.h
#import <Foundation/Foundation.h>
#import "DelimetedFile.h"

@interface Band : NSObject<TabSeparatedFileDelegate>

@property(nonatomic, assign)int uid;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSArray* members;

@end

--- Band.m
#import "Band.h"

@implementation Band

-(void)fromValues:(NSArray*)tsv {
    self.uid = [[tsv objectAtIndex:0] intValue];
    self.name = [tsv objectAtIndex:1];
    self.members = [[tsv objectAtIndex:2] componentsSeparatedByString:@","];
}

-(NSString*)description {
    NSMutableString* s = [NSMutableString string];
    [s appendFormat:@"%d %@:", self.uid, self.name];
    for (NSString* member in self.members) {
        [s appendString:@" "];
        [s appendString:member];
    }
    return s;
}

@end
