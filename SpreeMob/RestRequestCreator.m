#import "RestRequestCreator.h"

@implementation RestRequestCreator

- (NSMutableURLRequest*) getGetRequestFor:(NSString *)url { 
    NSURL* urlObj = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: urlObj];
    [request setHTTPMethod: @"GET"];
    return request;
}


- (NSMutableURLRequest*) getPostRequestFor:(NSString *) url withParameters:(NSDictionary *) parameters{
    
    NSURL* urlObj = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: urlObj];
    
    NSMutableString *post= [[NSMutableString alloc] init];
    
    NSEnumerator *enumerator = [parameters keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        NSString *value = [parameters objectForKey:key];
        
        NSString* parameterString = [NSString stringWithFormat:@"%@=%@&",key,value];
        
        [post appendString:parameterString];        
    }
    
    NSData *requestData = [NSData dataWithBytes:[post UTF8String] length:[post length]];
    
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    return request;
}


- (NSMutableURLRequest *)getPutRequestFor:(NSString *)url withJSONDictionary:(NSDictionary *)jsonDictionary {
    
    NSURL* urlObj = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: urlObj];
    
    NSError* error = nil;
    NSData* requestData = [NSJSONSerialization dataWithJSONObject:jsonDictionary 
                                                   options:kNilOptions error:&error];
    
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    [request setHTTPMethod: @"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    return request;    
}

- (NSMutableURLRequest *)getPostRequestFor:(NSString *)url withJSONDictionary:(NSDictionary *)jsonDictionary{
        
    NSURL* urlObj = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: urlObj];
    
    NSError* error = nil;
    NSData* requestData = [NSJSONSerialization dataWithJSONObject:jsonDictionary 
                                                          options:kNilOptions error:&error];
    
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    
    return request;    
}

@end
