//
//  ATUser.m
//  ATTable
//
//  Created by MOBILE MAC1 on 7/14/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import "ATUser.h"

#define kUsername @"name"
#define kEmailId @"email"
#define kUserId @"id"

@implementation ATUser

#pragma mark -
#pragma mark Init Methods

- (void)initialiseWithSafeValues
{
    _name = @"";
    _email = @"";
    _userId = @"";
}

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self)
    {
        [self initialiseWithSafeValues];
        [self processDictionary:dictionary];
    }
    return self;
}

#pragma mark -
#pragma mark Dictionary Parsing

- (void)processDictionary:(NSDictionary*)dictionary
{
    if (dictionary)
    {
        _name = [dictionary safeStringForKey:kUsername];
        _email = [dictionary safeStringForKey:kEmailId];
        _userId = [NSString stringWithFormat:@"%d", [[dictionary safeNumberForKey:kUserId] intValue]];
    }
}
@end
