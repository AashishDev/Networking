//
//  ATUserListViewController.h
//  ATTable
//
//  Created by MOBILE MAC1 on 7/13/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATUser.h"
#import "UserListDataSoucre.h"

@interface ATUserListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl* refreshControl;
@end
