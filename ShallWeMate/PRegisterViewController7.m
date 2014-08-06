//
//  PRegisterViewController7.m
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController7.h"
#import "PSummeryViewController.h"


@interface PRegisterViewController7 ()

@end

@implementation PRegisterViewController7
@synthesize houseData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.houseData printAll];
    
    selectionTableViewController = [[SelectionTableViewController alloc]init];
    selectionTableViewController.delegate = self;
    selectionTableViewController.selectTableView = self.selectTableView;
    [selectionTableViewController setNumberOfRowsInSection:5];
    self.selectTableView.delegate = selectionTableViewController;
    self.selectTableView.dataSource = selectionTableViewController;
}

- (void)didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableHouseRoles replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableHouseRoles replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        PSummeryViewController *vc = [segue destinationViewController];
        vc.houseData = self.houseData;
    }
}


@end
