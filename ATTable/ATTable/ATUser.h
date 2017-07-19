//
//  ATUser.h
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+SafeValues.h"

@interface ATUser : NSObject

/**
 *  User's name
 */
@property (nonatomic, copy) NSString* name;

/**
 *  User's email address
 */
@property (nonatomic, copy) NSString* email;

/**
 *  User's id
 */
@property (nonatomic, copy) NSString* userId;

/**
*  Designated Initializer
*
*  @param dictionary The dictionary containing the User data
*
*  @return ATUser instance
*/
- (instancetype)initWithDictionary:(NSDictionary*)dictionary NS_DESIGNATED_INITIALIZER;

@end
