//
//  ListModel.h
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-01.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic, strong) NSMutableArray *collection;

- (void)addItemFromJSON:(NSDictionary *)json;

@end
