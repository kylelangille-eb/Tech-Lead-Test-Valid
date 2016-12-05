//
//  DetailViewController.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-02.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController {
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *typeLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    nameLabel.text = self.item.name;
    descriptionLabel.text = self.item.description;
    typeLabel.text = self.item.type;
}

@end
