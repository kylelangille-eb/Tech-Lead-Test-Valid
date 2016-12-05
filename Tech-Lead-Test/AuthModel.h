//
//  AuthModel.h
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-02.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthModel : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *userToken;

- (id)initWithJSON:json;

@end
