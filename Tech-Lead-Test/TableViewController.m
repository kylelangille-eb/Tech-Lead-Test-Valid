//
//  TableViewController.m
//  Tech-Lead-Test
//
//  Created by Kyle on 2016-12-01.
//  Copyright © 2016 Eventbase. All rights reserved.
//

#import "TableViewController.h"

#import <AFNetworking/AFNetworking.h>

#import "Config.h"
#import "DetailViewController.h"
#import "ItemModel.h"
#import "ListModel.h"

@implementation TableViewController {
    ListModel *list;
    int selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    list = [ListModel new];
    [self requestData];
    
    selected = 0;
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [list.collection count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    
    cell.textLabel.text = ((ItemModel *)[list.collection objectAtIndex:indexPath.row]).name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selected = (int)indexPath.row;
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ((DetailViewController *)segue.destinationViewController).item = ((ItemModel *)[list.collection objectAtIndex:selected]);
}

#pragma mark - Network Requests

- (void)requestData {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    
    NSDictionary *params = @{@"userToken":self.authModel.userToken, @"userName":self.authModel.userName};
    
    [manager GET:serverDataUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *itemArray = [responseObject objectForKey:@"items"];
        for (NSDictionary *item in itemArray) {
            [list addItemFromJSON:item];
        }
        
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}


@end
