//
//  ItemModel.h
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-01.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *description;

- (id)initWithJSON:json;

@end
