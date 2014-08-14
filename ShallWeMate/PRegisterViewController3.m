//
//  PRegisterViewController3.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController3.h"
#import "PRegisterViewController4.h"

@interface PRegisterViewController3 ()

@end

@implementation PRegisterViewController3
@synthesize allRoomLabel;
@synthesize posibleRoomLabel;
@synthesize houseData;
@synthesize selectList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        [self.houseData printAll];
    
    NSLog(@"PRegisterViewController");
    [self.houseData printAll];
    
    selectionCollection = [[SelectionCollectionViewController alloc] init];
    selectionCollection.delegate = self;
    selectionCollection.viewController = @"enableRoomsMore";
    [selectionCollection setNumberOfItemsInSection:9];//(int)[houseData.enableRoomsMore count]];
    [selectionCollection setSelectList:self.selectList];
    [selectionCollection selectionListInit];
    
    [self.selectList setDelegate:selectionCollection];
    [self.selectList setDataSource:selectionCollection];
    
    [self refreshHouseData];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
   
    self.houseData.roomAll = allRoomLabel.text;
    self.houseData.roomEmpty = posibleRoomLabel.text;
    
}

- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableRoomsMore replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableRoomsMore replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
    
}

- (void) refreshHouseData
{
    if (houseData.roomAll != nil) {
        self.allRoomLabel.text = houseData.roomAll;
    }
    
    if (houseData.roomEmpty != nil) {
        self.posibleRoomLabel.text = houseData.roomEmpty;
    }
    
    
    
    for (int i=0; i<[houseData.enableRoomsMore count]; i++) {
        NSNumber *num = [houseData.enableRoomsMore objectAtIndex:i];
        if ([num boolValue]) {
            
            [selectionCollection selectItem:i];
        }
    }
    
}

- (IBAction)avgAgeSelect:(id)sender {
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    [pickerView setDelegate:self];
    [pickerView setDataSource:self];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [pickerView setFrame:CGRectMake(0.0f,
                                    keyWindow.frame.size.height - pickerView.frame.size.height,
                                    keyWindow.frame.size.width,
                                    pickerView.frame.size.height)];
    [keyWindow addSubview:pickerView];
    
}

//- (void)dealloc {
//    [allRoomLabel release];
//    [posibleRoomLabel release];
    //    [arMinusBtn release];
    //    [arPlusBtn release];
    //    [prMinusRoom release];
    //    [prMinusBtn release];
    //    [prPlusBtn release];
    //    [arPlus release];
    //    [prPlus release];
//    [avgAgeBtn release];
//    [super dealloc];
//}

- (IBAction)arMinus:(id)sender {
    if ([allRoomLabel.text isEqualToString:@"1"]) {
        
    } else {
        int roomNum = [allRoomLabel.text intValue];
        roomNum--;
        NSString *nStr = [NSString stringWithFormat:@"%d",roomNum];
        allRoomLabel.text = nStr;
    }
}

- (IBAction)arPlus:(id)sender {
    int roomNum = [allRoomLabel.text intValue];
    roomNum++;
    NSString *nStr = [NSString stringWithFormat:@"%d",roomNum];
    allRoomLabel.text = nStr;
    
}
- (IBAction)prMinus:(id)sender {
    if ([posibleRoomLabel.text isEqualToString:@"1"]) {
        
    } else {
        int roomNum = [posibleRoomLabel.text intValue];
        roomNum--;
        NSString *nStr = [NSString stringWithFormat:@"%d",roomNum];
        posibleRoomLabel.text = nStr;
    }
    
    
}

- (IBAction)prPlus:(id)sender {
    if ([allRoomLabel.text isEqualToString:posibleRoomLabel.text]) {
        
    } else {
        int roomNum = [posibleRoomLabel.text intValue];
        roomNum++;
        NSString *nStr = [NSString stringWithFormat:@"%d",roomNum];
        posibleRoomLabel.text = nStr;
    }
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
        houseData.roomAll = allRoomLabel.text;
        houseData.roomEmpty = self.posibleRoomLabel.text;
        
        PRegisterViewController4 *vc = [segue destinationViewController];
        vc.houseData = houseData;
    }
}


@end
