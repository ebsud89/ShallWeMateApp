//
//  RegisterViewController3.m
//  start
//
//  Created by 컴038 on 7/24/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController3.h"
#import "RegisterViewController4.h"
@interface RegisterViewController3 ()
@property (nonatomic, strong) UILabel *ageTitleLabel;
@end
@implementation RegisterViewController3
@synthesize ageBtn;
@synthesize ageTitleLabel;
@synthesize avgAgeLabel;

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
    
    [self refreshHouseData];
    
    
    agesArray = [[NSArray alloc] initWithObjects: @"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
    
    
    //cursor coloer
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
    [_sameSex setTag:0];
    [_sameSex setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_sameSex setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_sameSex addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [_mixedSex setTag:1];
    [_mixedSex setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_mixedSex setTitleColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000] forState:UIControlStateSelected];
    [_mixedSex addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)radiobuttonSelected:(id)sender{
    switch ([sender tag]) {
        case 0:
            if([_sameSex isSelected]==YES)
            {
                [_sameSex setSelected:NO];
                [_mixedSex setSelected:YES];
            }
            else{
                [_sameSex setSelected:YES];
                [_mixedSex setSelected:NO];
            }
            
            break;
        case 1:
            if([_mixedSex isSelected]==YES)
            {
                [_mixedSex setSelected:NO];
                [_sameSex setSelected:YES];
            }
            else{
                [_mixedSex setSelected:YES];
                [_sameSex setSelected:NO];
            }
            
            break;
        default:
            break;
    }
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self viewDidLoad];
    //[[self] popViewControllerAnimated:YES];
    //[[self navigationController] popViewControllerAnimated:YES];
    
}

- (void) refreshHouseData
{
    
    
    /* 수요자측 데이터 (메이트 평균연령, 성별) 뿌리기
     
     */
    
    if (_memberData.avgAge != nil) {
        self.ageTitleLabel.text = _memberData.avgAge;
    }

    if (_memberData.allowsex != nil) {
        if ([_memberData.allowsex isEqualToString:@"0"]) {
            [_sameSex setSelected:YES];
            [_mixedSex setSelected:NO];
        } else if ([_memberData.allowsex isEqualToString:@"1"]) {
            [_mixedSex setSelected:YES];
            [_sameSex setSelected:NO];
        }
    }
    
}

- (void)fillhouseData
{
    /* 기입한 정보 (메이트 성별, 평균 연령) 저장하기 */
    
    _memberData.avgAge = self.ageTitleLabel.text;
    
    if (_sameSex.isSelected == 1)
        self.memberData.allowsex = @"0";
    else if (_mixedSex.isSelected == 1)
        self.memberData.allowsex = @"1";
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
        avgAgeLabel.text = [agesArray objectAtIndex:row];
        avgAgeLabel.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        RegisterViewController4 *vc = [segue destinationViewController];
        
        /* 기입한 정보를 다음 뷰로 전달*/
        
        vc.memberData = _memberData;
        [self fillhouseData];
        
    }
    
    
}

@end
