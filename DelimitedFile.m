//
// Copyright (c) 2012 Norman Basham
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
#import "DelimitedFile.h"
#import <objc/runtime.h>

@implementation DelimitedFile

+(NSArray*)loadCSV:(NSString*)fileName toClass:(Class)c {
    BOOL conformsToProtocol = [c conformsToProtocol:@protocol(CommaSeparatedFileDelegate)];
    if(!conformsToProtocol) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Class parameter must conform to protocol: CommaSeparatedFileDelegate" userInfo:nil];
    }
    return [DelimitedFile _load:fileName toClass:c delimeter:@","];
}

+(NSArray*)loadTSV:(NSString*)fileName toClass:(Class)c {
    BOOL conformsToProtocol = [c conformsToProtocol:@protocol(TabSeparatedFileDelegate)];
    if(!conformsToProtocol) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Class parameter must conform to protocol: TabSeparatedFileDelegate" userInfo:nil];
    }
    return [DelimitedFile _load:fileName toClass:c delimeter:@"\t"];
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
        NSString* testForEmptyLines = [s stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        if([testForEmptyLines length] < 1) {
            continue;   //  skip this line
        }
        NSArray* lineChunks = [s componentsSeparatedByString: delimeter];
        id<AbstractDelimitedFileDelegate> o = [[c alloc] init];
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
