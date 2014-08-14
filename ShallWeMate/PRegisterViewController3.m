//
//  PRegisterViewController3.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController3.h"
#import "PRegisterViewController4.h"
#import "SelectionCollectionViewController.h"

@interface PRegisterViewController3 ()

@end

@implementation PRegisterViewController3
@synthesize allRoomLabel;
@synthesize posibleRoomLabel;
@synthesize houseData;

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
    
    selectionCollection = [[SelectionCollectionViewController alloc] init];
    selectionCollection.delegate = self;
    [selectionCollection setNumberOfItemsInSection:(int)[houseData.enableManagementStates count]];
    [selectionCollection setSelectList:self.selectList];
    [selectionCollection selectionListInit];
    
    [self.selectList setDelegate:selectionCollection];
    [self.selectList setDataSource:selectionCollection];
    
   
}

-(void)viewDidAppear:(BOOL)animated {

}

- (void) didSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableRoomsMore replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
}

- (void) didDeSelectedItem:(NSIndexPath *)indexPath
{
    [houseData.enableRoomsMore replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
}

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
