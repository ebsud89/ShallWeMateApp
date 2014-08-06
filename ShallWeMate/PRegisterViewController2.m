//
//  PRegisterViewController2.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController2.h"
#import "PRegisterViewController3.h"

@interface PRegisterViewController2 ()

@end

@implementation PRegisterViewController2
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
    
    NSLog(@"PRegisterViewController2");
    [self.houseData printAll];
    
    selectionCollection = [[SelectionCollectionViewController alloc] init];
    selectionCollection.delegate = self;
    [selectionCollection setNumberOfItemsInSection:(int)[houseData.enableManagementStates count]];
    [selectionCollection setSelectList:self.selectList];
    [selectionCollection selectionListInit];
    
    [self.selectList setDelegate:selectionCollection];
    [self.selectList setDataSource:selectionCollection];
    
    [self refreshHouseData];
    

}

- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableManagementStates replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableManagementStates replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
}

- (void) refreshHouseData
{
    if (houseData.securityCost != nil) {
        self.securityTextField.text = houseData.securityCost;
    }
    
    if (houseData.monthlyRentCost != nil) {
        self.monthlyRentTextField.text = houseData.monthlyRentCost;
    }
    
    if (houseData.managementCost != nil) {
        self.managementTextField.text = houseData.managementCost;
    }
    

    for (int i=0; i<[houseData.enableManagementStates count]; i++) {
        NSNumber *num = [houseData.enableManagementStates objectAtIndex:i];
        if ([num boolValue]) {

            [selectionCollection selectItem:i];
        }
    }

}

- (void) updateHouseData
{
    houseData.securityCost = self.securityTextField.text;
    houseData.managementCost = self.managementTextField.text;
    houseData.monthlyRentCost = self.monthlyRentTextField.text;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES ];
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
        [self updateHouseData];
        
        PRegisterViewController3 *vc = [segue destinationViewController];
        vc.houseData = houseData;
    }
}


@end
