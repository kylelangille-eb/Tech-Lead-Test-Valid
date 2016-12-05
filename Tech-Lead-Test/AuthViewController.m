//
//  AuthViewController.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-02.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "AuthViewController.h"

#import <AFNetworking/AFNetworking.h>

#import "AuthModel.h"
#import "Config.h"
#import "TableViewController.h"

@implementation AuthViewController {
    AuthModel *authModel;
}

#pragma mark - Navigation

- (IBAction)authButtonPressed:(id)sender {
    [self requestAuth];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((TableViewController *)segue.destinationViewController).authModel = authModel;
}

#pragma mark - Network Requests

- (void)requestAuth {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    NSDictionary *params = @{@"serverToken":serverToken};
    
    [manager GET:serverAuthUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        authModel = [[AuthModel alloc] initWithJSON:responseObject];
        [self performSegueWithIdentifier:@"authSegue" sender:self];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}


@end
