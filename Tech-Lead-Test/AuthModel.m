//
//  AuthModel.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-02.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "AuthModel.h"

@implementation AuthModel

@synthesize userName, userPassword, userToken;

- (id)initWithJSON:json {
    self = [super init];
    
    if (self) {
        self.userName = [json objectForKey:@"userName"];
        self.userPassword = [json objectForKey:@"userPassword"];
        self.userToken = [json objectForKey:@"userToken"];
    }
    
    return self;
}

@end
