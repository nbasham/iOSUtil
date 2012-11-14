#import "State.h"

@implementation State

-(void)fromValues:(NSArray*)csv {
    self.name = [csv objectAtIndex:0];
    self.population = [[csv objectAtIndex:1] intValue];
    self.capital = [csv objectAtIndex:2];
}

-(NSString*)description {
    NSMutableString* s = [NSMutableString string];
    [s appendFormat:@"%@ %@ %d", self.name, self.capital, self.population];
    return s;
}

@end
