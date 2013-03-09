#import <Foundation/Foundation.h>
#import "ConnectionData.h"
#import "RestRequestCreator.h"

@protocol ConnectionHandlerDelegate <NSObject>

- (void) connectionSuccessful:(ConnectionData*) data;
- (void) connectionUnsuccessful:(ConnectionData*) data;
- (void) connectionError:(NSError*) error;

@end

@interface ConnectionHandler : NSObject 

- (id)initWithDelegate:(NSObject<ConnectionHandlerDelegate> *) aClient;

- (void) post:(NSString *) url withParameters:(NSDictionary *) parameters;
- (void ) post:(NSString *) url withJSONDictionary:(NSDictionary *) jsonDictionary;
- (void) put:(NSString *) url withJSONDictionary:(NSDictionary *) jsonDictionary;
- (void) get:(NSString*) url;

@end
