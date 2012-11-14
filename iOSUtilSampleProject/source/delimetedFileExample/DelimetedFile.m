//
//  Created by Norman Basham on 11/13/12.
//  Copyright (c) 2012 Norman Basham. All rights reserved.
//

#import "DelimetedFile.h"
#import <objc/runtime.h>

@implementation DelimetedFile

+(NSArray*)loadCSV:(NSString*)fileName toClass:(Class)c {
    BOOL conformsToProtocol = [c conformsToProtocol:@protocol(CommaSeparatedFileDelegate)];
    if(!conformsToProtocol) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Class parameter must conform to protocol: CommaSeparatedFileDelegate" userInfo:nil];
    }
    return [DelimetedFile _load:fileName toClass:c delimeter:@","];
}

+(NSArray*)loadTSV:(NSString*)fileName toClass:(Class)c {
    BOOL conformsToProtocol = [c conformsToProtocol:@protocol(TabSeparatedFileDelegate)];
    if(!conformsToProtocol) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Class parameter must conform to protocol: TabSeparatedFileDelegate" userInfo:nil];
    }
    return [DelimetedFile _load:fileName toClass:c delimeter:@"\t"];
}

+(NSArray*)_load:(NSString*)fileName toClass:(Class)c delimeter:(NSString*)delimeter {
    NSMutableArray* a = [NSMutableArray array];
    NSString* path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    if(path == nil) {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"Unable to find fileName '%@'", fileName] userInfo:nil];
    }
    NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray*  fileLines = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    for (NSString* s in fileLines) {
        NSString* test = [s stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        if([test length] < 1) {
            continue;
        }
        NSArray* lineChunks = [s componentsSeparatedByString: delimeter];
        id<AbstractDelimetedFileDelegate> o = [[c alloc] init];
        @try {
            [o fromValues:lineChunks];
        }
        @catch (NSException* exception) {
            const char* className = class_getName(c);
            NSLog(@"[%s fromValues:%@] failed: %@", className, [lineChunks description], exception.reason);
        }
        [a addObject:o];
    }
    return a;
}

@end
