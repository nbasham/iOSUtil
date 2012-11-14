#import <Foundation/Foundation.h>
#import "DelimetedFile.h"

@interface Band : NSObject<TabSeparatedFileDelegate>

@property(nonatomic, assign)int uid;
@property(nonatomic, strong)NSString* name;
@property(nonatomic, strong)NSArray* members;

@end
