//
//  Created by Norman Basham on 11/13/12.
//  Copyright (c) 2012 Norman Basham. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AbstractDelimetedFileDelegate <NSObject>
-(id)fromValues:(NSArray*)tsv;
@end

@protocol TabSeparatedFileDelegate <AbstractDelimetedFileDelegate>
@end

@protocol CommaSeparatedFileDelegate <AbstractDelimetedFileDelegate>
@end

@interface DelimetedFile : NSObject

+(NSArray*)loadCSV:(NSString*)fileName toClass:(Class)c;
+(NSArray*)loadTSV:(NSString*)fileName toClass:(Class)c;

@end
