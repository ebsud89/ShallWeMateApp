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

- (IBAction)backButtonClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"PRegisterViewController2");
    [self.houseData printAll];
    
    selectionCollection = [[SelectionCollectionViewController alloc] init];
    selectionCollection.delegate = self;
    selectionCollection.viewController = @"enableManagementStates";
    [selectionCollection setNumberOfItemsInSection:8];//(int)[houseData.enableManagementStates count]];
    [selectionCollection setSelectList:self.selectList];
    [selectionCollection selectionListInit];
    
    [self.selectList setDelegate:selectionCollection];
    [self.selectList setDataSource:selectionCollection];
    
    [self refreshHouseData];
    
    //키보드 올라갈 때 뷰 올리기
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    //cursor coloer
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
    self.houseData.monthlyRentCost = _monthlyRentTextField.text;
    self.houseData.securityCost = _securityTextField.text;
    self.houseData.managementCost = _managementTextField.text;
}


- (void)setViewMovedUp:(BOOL)movedUp height:(float)height

{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    
    if (movedUp)
    {
        //        rect.origin.y -= height;
        //        rect.size.height += height;
        rect.origin.y -= 40;
        rect.size.height += 40;
    }
    else
    {
        //        rect.origin.y += height;
        //        rect.size.height -= height;
        rect.origin.y += 40;
        rect.size.height -= 40;
    }
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
    
}



- (void)keyboardWillShow:(NSNotification *)notification

{
    
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect;
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardRect];
    
    if (self.view.frame.origin.y >= 0)
        
    {
        [self setViewMovedUp:YES height:keyboardRect.size.height];
    }
    else if (self.view.frame.origin.y < 0)
        
    {
        [self setViewMovedUp:NO height:keyboardRect.size.height];
        
    }
    
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:TRUE];
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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
