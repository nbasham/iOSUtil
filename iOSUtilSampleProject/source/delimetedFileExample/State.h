#import <Foundation/Foundation.h>
#import "DelimitedFile.h"

@interface State : NSObject<DelimitedFileDelegate>

@property(nonatomic, strong)NSString* name;
@property(nonatomic, assign)int population;
@property(nonatomic, strong)NSString* capital;

@end
