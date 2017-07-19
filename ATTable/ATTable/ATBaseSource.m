//
//  ATBaseSource.m
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import "ATBaseSource.h"

@implementation ATBaseSource

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}

#pragma mark - Response Data Parsing

- (NSDictionary *)dictionaryFromResponseData:(id)object jsonPatternFile:(NSString *)jsonFile
{
    NSDictionary* dictionary = nil;
    
    if (object)
    {
        //id object = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
        
        if ([object isKindOfClass:[NSDictionary class]])
        {
            dictionary = (NSDictionary*)object;
        }
        else
        {
            if (object)
            {
                dictionary = [NSDictionary dictionaryWithObject:object forKey:@"results"];
            }
            else
            {
                dictionary = nil;
            }
        }
    }
    return dictionary;
}

@end
