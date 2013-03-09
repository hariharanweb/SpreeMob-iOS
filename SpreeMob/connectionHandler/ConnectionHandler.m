#import "ConnectionHandler.h"

@interface ConnectionHandler()

@property NSObject<ConnectionHandlerDelegate>* client;
@property ConnectionData *responseData;

@end

@implementation ConnectionHandler

@synthesize client;
@synthesize responseData;

- (id)initWithDelegate:(NSObject<ConnectionHandlerDelegate> *) aClient
{
    self = [super init];
    if (self) {
        client = aClient;
    }
    return self;
}

- (void)connect:(NSMutableURLRequest *)request{
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(@"Contacting the server %@", [[request URL] absoluteString]);
    if(!connection){
        [client connectionError:nil];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {    

    responseData = [[ConnectionData alloc] init];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    responseData.responseCode = [httpResponse statusCode];
    if (!([httpResponse statusCode] >= 400)) {
        responseData.success = true;
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [[responseData data] appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error connecting %@",error);
    [client connectionError:error];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
    if([responseData success])
       [client connectionSuccessful: responseData];
    else 
       [client connectionUnsuccessful: responseData];
}

-(void)post:(NSString *)url withParameters:(NSDictionary *)parameters {
    RestRequestCreator *requestCreator = [[RestRequestCreator alloc]init];
    NSMutableURLRequest *request = [requestCreator getPostRequestFor:url withParameters:parameters];
    [self connect:request];
}
    
- (void)post:(NSString *)url withJSONDictionary:(NSDictionary *)jsonDictionary {
    RestRequestCreator *requestCreator = [[RestRequestCreator alloc]init];
    NSMutableURLRequest *request = [requestCreator getPostRequestFor:url withJSONDictionary:jsonDictionary];
    NSLog(@"Data posted %@",jsonDictionary);
    [self connect:request];
}

- (void)put:(NSString *)url withJSONDictionary:(NSDictionary *)jsonDictionary {
    RestRequestCreator *requestCreator = [[RestRequestCreator alloc]init];
    NSMutableURLRequest *request = [requestCreator getPutRequestFor:url withJSONDictionary:jsonDictionary];
    [self connect:request];
}

- (void) get:(NSString*) url {
    RestRequestCreator *requestCreator = [[RestRequestCreator alloc]init];
    NSMutableURLRequest *request = [requestCreator getGetRequestFor:url];
    [self connect:request];
}

@end
