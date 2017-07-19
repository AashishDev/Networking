//
//  ATUserListViewController.m
//  ATTable
//
//  Created by MOBILE MAC1 on 7/13/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import "ATUserListViewController.h"

@interface ATUserListViewController ()

@property(nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation ATUserListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupTableView];
    [self requestUsersFeed];
}

#pragma mark - Setup Methods

- (void)setupTableView
{
    self.tableView.rowHeight = 55;
    if (!_refreshControl)
    {
        _refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
        
        [self.refreshControl addTarget:self action:@selector(requestUsersFeed) forControlEvents:UIControlEventValueChanged];
        [self.tableView addSubview:_refreshControl];
    }
}

#pragma mark - Network Requests methods
-(void)requestUsersFeed{

    ATUserListCompletionBlock completionBlock = ^(NSArray* dataArray, NSString* errorString)
    {
        [self.refreshControl endRefreshing];
        if (dataArray != nil)
        {
            NSLog(@"DataArray is :--%@",dataArray);
            [self processData:dataArray];
        }
        else
        {
            //[self.networkLoadingViewController showErrorView];
        }
    };
    UserListDataSoucre* source = [UserListDataSoucre userListSource];
    [source getUsersListcompletion:completionBlock];
}

#pragma mark - Fetched Data Processing

- (void)processData:(NSArray *)data
{
    if ([data count] == 0)
    {
        //[self.networkLoadingViewController showNoContentView];
    }
    else
    {
        //[self hideLoadingView];
        if (!self.dataSource)
        {
            self.dataSource = [[NSMutableArray alloc] init];
        }
        self.dataSource = [NSMutableArray arrayWithArray:data];
        
        [self.tableView reloadData];
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    /*
     * A] Fill User details in Table
     */
    [cell.textLabel setText:[[self.dataSource objectAtIndex:indexPath.row] name]];
    [cell.detailTextLabel setText:[[self.dataSource objectAtIndex:indexPath.row] email]];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
