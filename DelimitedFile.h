//
//    Copyright (c) 2012 Norman Basham
//    http://www.apache.org/licenses/LICENSE-2.0
//
#import <Foundation/Foundation.h>

#define kTabDelimeter '\t'
#define kCommaDelimeter ','

@protocol DelimitedFileDelegate <NSObject>
-(void)fromValues:(NSArray*)tsv;
@end

@interface DelimitedFile : NSObject

+(NSArray*)load:(NSString*)fileName toClass:(Class)c delimeter:(char)delimeter;

@end
