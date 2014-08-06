//
//  PRegisterViewController7.h
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionTableViewController.h"

@interface PRegisterViewController7 : UIViewController <selectionTableViewDelegate>
{
    SelectionTableViewController *selectionTableViewController;
}
@property (strong, nonatomic) HouseData *houseData;
@property (strong, nonatomic) IBOutlet UITableView *selectTableView;

@end
