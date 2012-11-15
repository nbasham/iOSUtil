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
#import <Foundation/Foundation.h>

#define kTabDelimeter '\t'
#define kCommaDelimeter ','

@protocol DelimitedFileDelegate <NSObject>
-(id)fromValues:(NSArray*)tsv;
@end

@interface DelimitedFile : NSObject

+(NSArray*)load:(NSString*)fileName toClass:(Class)c delimeter:(char)delimeter;

@end
