//
//  JSONObject.m
//  MPOS
//
//  Created by Thoughtworks Technologies on 26/04/12.
//  Copyright (c) 2012 isassetmgmt@thoughtworks.com. All rights reserved.
//

#import "JSONObject.h"
#import <objc/runtime.h>

@implementation JSONObject

- (NSDictionary *)getJSONDictionary{
    
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
   
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        
        
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
  
        
        if (propertyValue && [propertyValue isKindOfClass:[JSONObject class]]){
            NSDictionary *dictionary = [propertyValue getJSONDictionary];
            [props setObject:dictionary forKey:propertyName];
        }else if (propertyValue && [propertyValue isKindOfClass:[NSMutableArray class]]){
            NSMutableArray* jsonArray = [[NSMutableArray alloc] init];
            
            NSMutableArray* arrayItems = ((NSMutableArray* )propertyValue);
            for (id item in arrayItems) {
                [jsonArray addObject:[item getJSONDictionary]];
            }
            
            [props setObject:jsonArray forKey:propertyName];
        }else if(propertyValue){
            [props setObject:propertyValue forKey:propertyName];
        }
            
        
        
    }
    free(properties);
    
    return props;
}

@end
