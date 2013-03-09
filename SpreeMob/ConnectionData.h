#import <Foundation/Foundation.h>

@interface ConnectionData : NSObject

@property NSMutableData* data;
@property bool success;
@property int responseCode;

@end
