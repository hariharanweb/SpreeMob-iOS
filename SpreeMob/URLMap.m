#import "URLMap.h"

@interface URLMap()

@property (retain, nonatomic) NSDictionary* urlMap;

@end

@implementation URLMap {
    NSObject<URLMapDelegate>* client;
}

@synthesize urlMap;

- (id)initWithDelegate:(NSObject<URLMapDelegate>*) delegate {
    self = [super init];
    if(self) {
        client = delegate;
    }
    return self;
}

- (void)initializeURLMap {
    self.urlMap = [[NSDictionary alloc] init];
    ConnectionHandler *handler = [[ConnectionHandler alloc]initWithDelegate:self];
    [handler get:[self getBaseURL]];
}

-(void)connectionSuccessful:(ConnectionData *)data {
    NSError* error;
    urlMap = [NSJSONSerialization 
                          JSONObjectWithData:[data data]                               
                          options:kNilOptions 
                          error:&error];
    [client urlMapInitializationSuccessful];
}

- (void)connectionUnsuccessful:(ConnectionData *)data {
    [client urlMapInitializationUnsuccessful];
}

- (void)connectionError:(NSError *)error {
    [client urlMapInitializationUnsuccessful];
}

- (NSString*) getURL:(NSString*) resource {
    return [urlMap objectForKey:resource];
}

- (NSString*) getBaseURL {    
    NSUserDefaults* settings =  [NSUserDefaults standardUserDefaults];
    NSLog(@"Contacting  %@",    [[settings dictionaryRepresentation] objectForKey:@"serverip"]);    
    return [[settings dictionaryRepresentation] objectForKey:@"serverip"];
}


@end
