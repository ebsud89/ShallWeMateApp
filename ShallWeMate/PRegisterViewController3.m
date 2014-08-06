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
@synthesize avgAgeBtn;
@synthesize roomInfoScrollView;
@synthesize optionScrollView;
@synthesize keywordScrollView;
@synthesize lifestyleScrollView;
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
    
    avgAgesArray = [[NSArray alloc] initWithObjects:@"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
    
   
}

-(void)viewDidAppear:(BOOL)animated {
    self.roomInfoScrollView.contentSize = CGSizeMake(320, 600);
    self.lifestyleScrollView.contentSize = CGSizeMake(320, 1200);
    self.optionScrollView.contentSize = CGSizeMake(320, 1200);
    self.keywordScrollView.contentSize = CGSizeMake(320, 1200);
//    [self.view addSubview:self.roomInfoScrollView];
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

// pickerView Component 갯수
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// pickerView row 갯수
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [avgAgesArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [avgAgeBtn setTitle:[avgAgesArray objectAtIndex:row] forState:UIControlStateNormal];
    
    //picker view 내리기
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    pickerView.transform = CGAffineTransformMakeTranslation(0, 275); //그냥 아래로 다시 내려주자
    [UIView commitAnimations];
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [avgAgesArray objectAtIndex:row];
    
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
