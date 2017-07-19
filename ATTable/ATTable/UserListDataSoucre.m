//
//  UserListDataSoucre.m
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import "UserListDataSoucre.h"

@implementation UserListDataSoucre

#pragma mark - Init Methods

+ (UserListDataSoucre *)userListSource;
{
    static dispatch_once_t onceToken;
    static UserListDataSoucre* instance = nil;
    
    dispatch_once(&onceToken, ^{
        instance = [[UserListDataSoucre alloc] init];
    });
    return instance;
}

#pragma mark - Request Methods

- (void)getUsersListcompletion:(ATUserListCompletionBlock)completionBlock;
{
    if (completionBlock)
    {
        //NSDictionary* parameters = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:pageLimit, nil] forKeys:[NSArray arrayWithObjects:@"page", nil]];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [manager GET:[self prepareUrl] parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            NSDictionary* infosDictionary = [self dictionaryFromResponseData:responseObject jsonPatternFile:@"KMDiscoverSourceJsonPattern.json"];
             
             dispatch_async(dispatch_get_main_queue(), ^{
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             completionBlock([self processResponseObject:infosDictionary], nil);
             });
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            
            NSLog(@"Error: %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                
                NSString* errorString = error.localizedDescription;
                if ([errorString length] == 0)
                {
                    errorString = nil;
                }
                completionBlock(nil, errorString);
            });
        }];
    }
}

#pragma mark - Data Parsing

- (NSArray *)processResponseObject:(NSDictionary*)data
{
    if (data)
    {
        NSArray* itemsList = [NSArray arrayWithArray:[data objectForKey:@"results"]];
        NSMutableArray* sortedArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary* item in itemsList)
        {
            ATUser* user = [[ATUser alloc] initWithDictionary:item];
           [sortedArray addObject:user];
        }
        return sortedArray;
    }
    return nil;
}

#pragma mark - Private
- (NSString *)prepareUrl
{
    return [NSString stringWithFormat:@"%@", [ATNetworkConfig config].hostUrlString];
}
@end
