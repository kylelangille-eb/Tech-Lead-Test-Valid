//
//  ListModel.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-01.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "ListModel.h"
#import "ItemModel.h"

@implementation ListModel

- (id)init {
    self = [super init];
    
    if (self) {
        self.collection = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addItemFromJSON:(NSDictionary *)json {
    ItemModel *item = [[ItemModel alloc] initWithJSON:json];
    [self.collection addObject:item];
}

@end
