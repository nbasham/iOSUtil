//
//  Created by Norman Basham on 11/13/12.
//  Copyright (c) 2012 Norman Basham. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AbstractDelimitedFileDelegate <NSObject>
-(id)fromValues:(NSArray*)tsv;
@end

@protocol TabSeparatedFileDelegate <AbstractDelimitedFileDelegate>
@end

@protocol CommaSeparatedFileDelegate <AbstractDelimitedFileDelegate>
@end

@interface DelimitedFile : NSObject

+(NSArray*)loadCSV:(NSString*)fileName toClass:(Class)c;
+(NSArray*)loadTSV:(NSString*)fileName toClass:(Class)c;

@end
