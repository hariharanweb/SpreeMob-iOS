//
//  RestHelper.h
//  MPOS
//
//  Created by Thoughtworks Technologies on 25/04/12.
//  Copyright (c) 2012 isassetmgmt@thoughtworks.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestRequestCreator : NSObject

- (NSMutableURLRequest*) getGetRequestFor:(NSString *) url;

- (NSMutableURLRequest*) getPostRequestFor:(NSString *) url withParameters:(NSDictionary *) parameters;

- (NSMutableURLRequest*) getPutRequestFor:(NSString *) url withJSONDictionary:(NSDictionary *) jsonDictionary;

- (NSMutableURLRequest*) getPostRequestFor:(NSString *) url withJSONDictionary:(NSDictionary *) jsonDictionary;

@end
