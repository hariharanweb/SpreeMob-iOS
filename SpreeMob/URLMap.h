#import <Foundation/Foundation.h>
#import "ConnectionHandler.h"
#import "NetworkError.h"

@protocol URLMapDelegate <NSObject>

@required
- (void) urlMapInitializationSuccessful;
- (void) urlMapInitializationUnsuccessful;

@end

@interface URLMap : NSObject <ConnectionHandlerDelegate>

- (id)initWithDelegate:(NSObject<URLMapDelegate>*) delegate;
- (void) initializeURLMap;
- (NSString*) getURL:(NSString*) resource;

@end
