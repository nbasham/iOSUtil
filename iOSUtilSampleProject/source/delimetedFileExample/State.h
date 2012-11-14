#import <Foundation/Foundation.h>
#import "DelimetedFile.h"

@interface State : NSObject<CommaSeparatedFileDelegate>

@property(nonatomic, strong)NSString* name;
@property(nonatomic, assign)int population;
@property(nonatomic, strong)NSString* capital;

@end
