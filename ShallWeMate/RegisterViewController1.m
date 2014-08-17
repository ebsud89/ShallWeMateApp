//
//  RegisterViewController1.m
//  start
//
//  Created by 컴038 on 7/15/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController1.h"
@interface RegisterViewController1()
@property (nonatomic, strong) UILabel *jobTitleLabel;
@end

@implementation RegisterViewController1
@synthesize houseData;
@synthesize jobButton;
@synthesize fbProfilePictureView;
@synthesize userName;
@synthesize radiobutton1;
@synthesize radiobutton2;
@synthesize jobTitleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        // Custom initialization
    }
    
    return self;
}

//글씨체
-(UIFont *)getFont
{
    UIFont *font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:15];
    return font;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    jobsArray = [[NSArray alloc] initWithObjects:@"직업을 선택해주세요.", @"학생", @"직장인", @"프리랜서", nil];
    // 버튼위에 라벨을 올려주기 위해 만듬
    jobTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(6.0f, 2.0f, 150.0f, 30.0f)];
    jobTitleLabel.textColor = [UIColor darkGrayColor];
    jobTitleLabel.textAlignment = NSTextAlignmentCenter;
    jobTitleLabel.backgroundColor = [UIColor clearColor];
    jobTitleLabel.font = [UIFont systemFontOfSize:14.0f];
    jobTitleLabel.lineBreakMode = NSLineBreakByClipping;
    [jobButton addSubview:jobTitleLabel];
    jobTitleLabel.text = [jobsArray objectAtIndex:0]; ;
    
    [jobButton addTarget:self action:@selector(jobSelect:)             forControlEvents:UIControlEventTouchUpInside];
    
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    self.fbProfilePictureView.layer.cornerRadius = self.fbProfilePictureView.frame.size.width / 2;
    self.fbProfilePictureView.clipsToBounds = YES;
    fbProfilePictureView.profileID = appDelegate.fbUserId;    
    
    
    userName.text = appDelegate.fbUserName;
    [userName setFont:[self getFont]];
    radiobutton1 = [[UIButton alloc] initWithFrame:CGRectMake(93, 310, 30, 30)];
    [radiobutton1 setTag:0];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateSelected];
    [radiobutton1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    radiobutton2 = [[UIButton alloc] initWithFrame:CGRectMake(183, 310, 30, 30)];
    [radiobutton2 setTag:1];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateSelected];
    [radiobutton2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:radiobutton1];
    [self.view addSubview:radiobutton2];
    //키보드 올라갈 때 뷰 올리기
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    //cursor color
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    
}

- (void)setUserDefaults {
    
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSString *age = _ageTextField.text;
    NSString *job = jobTitleLabel.text;
    
    // Store the data
    appDelegate.defaults = [NSUserDefaults standardUserDefaults];
    
    [appDelegate.defaults setObject:job forKey:@"job"];
    [appDelegate.defaults setObject:age forKey:@"age"];
    //                                              [defaults setInteger:birthday forKey:@"birthday"];
    //                                              [defaults setObject:imageData forKey:@"image"];
    
    [appDelegate.defaults synchronize];

}

- (void)setViewMovedUp:(BOOL)movedUp height:(float)height

{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    height -= 50;
    if (movedUp)
    {
        rect.origin.y -= height;
        rect.size.height += height;
        
    }
    else
    {
        rect.origin.y += height;
        rect.size.height -= height;
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



-(void)radiobuttonSelected:(id)sender{
    switch ([sender tag]) {
        case 0:
            if([radiobutton1 isSelected]==YES)
            {
                [radiobutton1 setSelected:NO];
                [radiobutton2 setSelected:YES];
            }
            else{
                [radiobutton1 setSelected:YES];
                [radiobutton2 setSelected:NO];
            }
            
            break;
        case 1:
            if([radiobutton2 isSelected]==YES)
            {
                [radiobutton2 setSelected:NO];
                [radiobutton1 setSelected:YES];
            }
            else{
                [radiobutton2 setSelected:YES];
                [radiobutton1 setSelected:NO];
            }
            
            break;
        default:
            break;
    }
    
}


- (IBAction)jobSelect:(id)sender {
    
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
    return [jobsArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    [jobButton setTitle:[jobsArray objectAtIndex:row] forState:UIControlStateNormal];
    jobTitleLabel.text = [jobsArray objectAtIndex:row];
    
    //picker view 내리기
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:1.0];
//    pickerView.transform = CGAffineTransformMakeTranslation(0, 275);
//    [UIView commitAnimations];
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [jobsArray objectAtIndex:row];
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        
        [self setUserDefaults];
    }
}

@end
