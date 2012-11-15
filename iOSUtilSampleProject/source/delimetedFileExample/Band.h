#import <Foundation/Foundation.h>
#import "DelimitedFile.h"

@interface Band : NSObject<DelimitedFileDelegate>

@property(nonatomic, assign)int uid;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSArray* members;

@end
