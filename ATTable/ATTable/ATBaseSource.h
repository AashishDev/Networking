//
//  ATBaseSource.h
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  `KMBaseSource` is a base network class providing operation queue management and response parsing tools
 */
@interface ATBaseSource : NSObject

/**
 *  The current operation queue on which a network class instance is running
 */
@property (nonatomic, strong) NSOperationQueue* operationQueue;

/**
 *  Use this method to validate json data.
 *
 *  @param responseData Data received from a network request
 *  @param jsonFile     JSON pattern file to which the received data should conform to
 *
 *  @return `NSDictionary` object
 */
- (NSDictionary * _Nullable)dictionaryFromResponseData:(NSData *)responseData jsonPatternFile:(NSString *)jsonFile;
@end

NS_ASSUME_NONNULL_END
