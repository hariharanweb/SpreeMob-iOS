#import "ConnectionData.h"

@implementation ConnectionData

@synthesize data;
@synthesize success;
@synthesize responseCode;

- (id)init
{
    self = [super init];
    if (self) {
        data = [[NSMutableData alloc] init];
        success = false;
    }
    return self;
}

@end
