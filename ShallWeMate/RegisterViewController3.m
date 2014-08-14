//
//  RegisterViewController3.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController3.h"
@interface RegisterViewController3 ()
@property (nonatomic, strong) UILabel *ageTitleLabel;
@end
@implementation RegisterViewController3
@synthesize houseData;

@synthesize ageTitleLabel;

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
    agesArray = [[NSArray alloc] initWithObjects:@"평균 연령을 선택해주세요", @"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
    
    // 버튼위에 라벨을 올려주기 위해 만듬
    ageTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(6.0f, 2.0f, 150.0f, 30.0f)];
    ageTitleLabel.textColor = [UIColor darkGrayColor];
    ageTitleLabel.textAlignment = NSTextAlignmentCenter;
    ageTitleLabel.backgroundColor = [UIColor clearColor];
    ageTitleLabel.font = [UIFont systemFontOfSize:14.0f];
    ageTitleLabel.lineBreakMode = NSLineBreakByClipping;
    [ageSelectBtn addSubview:ageTitleLabel];
    ageTitleLabel.text = [agesArray objectAtIndex:0]; ;
    
    [ageSelectBtn addTarget:self action:@selector(selectAgeButtonClicked:)             forControlEvents:UIControlEventTouchUpInside];
    
    //cursor coloer
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}
- (IBAction)ageSelect:(id)sender {
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self     cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,40, 320, 216)];
    picker.showsSelectionIndicator=YES;
    picker.dataSource = self;
    picker.delegate = self;
    picker.tag = 0;
    [actionSheet addSubview:picker];
    
    // pickerView 상단에 올라갈 닫기 버튼 만들기
    UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:
                                       [NSArray arrayWithObject:@"완료"]];
    closeButton.momentary = YES;
    closeButton.frame = CGRectMake(260, 7.0f, 50.0f, 30.0f);
    closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
    closeButton.tintColor = [UIColor blackColor];
    [closeButton addTarget:self action:@selector(dismissAnimated:) forControlEvents:UIControlEventValueChanged];
    [actionSheet addSubview:closeButton];
    [actionSheet showInView:self.view];
    
    [actionSheet showFromRect:CGRectMake(0,480, 320,215) inView:self.view animated:YES];
    [actionSheet setBounds:CGRectMake(0,0, 320, 411)];
    
    
}
    
    
    // pickerView Component 갯수
    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        return 1;
    }
    // pickerView row 갯수
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        return [agesArray count];
    }
    
    - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
    {
        NSLog(@"%@",[agesArray objectAtIndex:row] );
        ageTitleLabel.text = [agesArray objectAtIndex:row];
    }
    
    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
        return [agesArray objectAtIndex:row];
    }
    
    
    // 피커뷰 'close'버튼 눌렀을 때,
    - (void)dismissAnimated:(UIButton *)button
    {
        [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
