//
//  UserListDataSoucre.h
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATUser.h"
#import "ATBaseSource.h"
#import <AFNetworking.h>
#import "ATNetworkConfig.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 'ATUserListCompletionBlock' for User list.
 *
 * @parameter dataArray an array of 'ATUser' object
 * @parameter errorString An error string
 */

typedef void(^ATUserListCompletionBlock)(NSArray* _Nullable dataArray, NSString* _Nullable errorString);


@interface UserListDataSoucre : ATBaseSource

/**
 *  Class method returning a `UserListDataSoucre` shared instance.
 *
 *  @return `KMDiscoverSource` instance
 */
+ (UserListDataSoucre *)userListSource;

/**
 *  Use this method to perform a GET request and fetch a list of Users.
 *
 */
- (void)getUsersListcompletion:(ATUserListCompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
