//
//  HTProductList.h
//  SpreeMob
//
//  Created by Hariharan Thiagarajan on 09/03/13.
//  Copyright (c) 2013 HTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTProductList : NSObject
@property (strong,atomic) NSArray *productList;

-(NSInteger) itemCount;
@end
