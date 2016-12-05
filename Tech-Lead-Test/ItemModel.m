//
//  ItemModel.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-01.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

@synthesize name, description, type;

- (id)initWithJSON:json {
    self = [super init];
    
    if (self) {
        self.name = [json objectForKey:@"name"];
        self.description = [json objectForKey:@"description"];
        self.type = [json objectForKey:@"type"];
    }
    
    return self;
}

@end
