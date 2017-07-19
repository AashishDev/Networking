//
//  ATNetworkConfig.m
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import "ATNetworkConfig.h"

#define kHostUrl @"https://jsonplaceholder.typicode.com/users"

@implementation ATNetworkConfig

#pragma mark - Init Methods
+(ATNetworkConfig *)config{

    static dispatch_once_t onceToken;
    static ATNetworkConfig * instance = nil;
    
    dispatch_once(&onceToken, ^{
        
        instance = [[ATNetworkConfig alloc] init];
    });
    return instance;
}

-(instancetype)init {

    self = [super init];
    if (self)
    {
        _hostUrlString = kHostUrl;
    }
    return self;
}





@end
