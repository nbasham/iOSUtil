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
