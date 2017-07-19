//
//  ATNetworkConfig.h
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 'ATNetworkConfig' provide Server related information.
 */
@interface ATNetworkConfig : NSObject

/**
 * Class method return shared reference.
 */
+(ATNetworkConfig *)config;

/**
 *  The API host url string
 */
@property (nonatomic, copy, readonly) NSString* hostUrlString;

@end
