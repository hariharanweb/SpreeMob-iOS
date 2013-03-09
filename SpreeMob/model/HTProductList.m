//
//  HTProductList.m
//  SpreeMob
//
//  Created by Hariharan Thiagarajan on 09/03/13.
//  Copyright (c) 2013 HTech. All rights reserved.
//

#import "HTProductList.h"

@interface HTProductList()
@end

@implementation HTProductList

- (id)init {
    self = [super init];
    if (self) {
        self.productList = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3"];
    }
    return self;
}

-(NSInteger) itemCount {
    return self.productList.count;
}

@end
