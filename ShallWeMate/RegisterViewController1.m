//
//  RegisterViewController1.m
//  start
//
//  Created by 컴038 on 7/15/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController1.h"
#import "RegisterViewController2.h"
@interface RegisterViewController1()
@property (nonatomic, strong) UILabel *jobTitleLabel;
@end

@implementation RegisterViewController1
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
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [super viewDidLoad];
//    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = backButtonItem;
//    
//    self.navigationItem.backBarButtonItem = backButtonItem;
    [self refreshHouseData];
    
    jobsArray = [[NSArray alloc] initWithObjects: @"학생", @"직장인", @"프리랜서", nil];
    // 버튼위에 라벨을 올려주기 위해 만듬
    jobTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(-25.0f, -5.0f, 150.0f, 30.0f)];
    jobTitleLabel.textColor = [UIColor lightGrayColor];
    jobTitleLabel.textAlignment = NSTextAlignmentCenter;
    jobTitleLabel.backgroundColor = [UIColor clearColor];
    //    jobTitleLabel.font = [UIFont fontWithName:@"Apple SD Gothic Neo-Regular" size:6];
    jobTitleLabel.lineBreakMode = NSLineBreakByClipping;
    [jobButton addSubview:jobTitleLabel];
    jobTitleLabel.text = @"직업을 선택해주세요.";
    
    [jobButton addTarget:self action:@selector(jobSelect:)             forControlEvents:UIControlEventTouchUpInside];
    
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    self.fbProfilePictureView.layer.cornerRadius = self.fbProfilePictureView.frame.size.width / 2;
    UIColor *borderColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0];
    [self.fbProfilePictureView.layer setBorderColor:borderColor.CGColor];
    [self.fbProfilePictureView.layer setBorderWidth:2.0];
    self.fbProfilePictureView.clipsToBounds = YES;
    fbProfilePictureView.profileID = appDelegate.fbUserId;
    
    
    userName.text = appDelegate.fbUserName;
    [userName setFont:[self getFont]];
    radiobutton1 = [[UIButton alloc] initWithFrame:CGRectMake(90, 338, 63, 18)];
    [radiobutton1 setTag:0];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"pic11.png"] forState:UIControlStateNormal];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"pic22.png"] forState:UIControlStateSelected];
    [radiobutton1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    radiobutton2 = [[UIButton alloc] initWithFrame:CGRectMake(173, 338, 63, 18)];
    [radiobutton2 setTag:1];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"pic11.png"] forState:UIControlStateNormal];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"pic22.png"] forState:UIControlStateSelected];
    [radiobutton2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    //    userName.text = @"입력하기";
    userName.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:1];
    userName.font = [UIFont systemFontOfSize:17];
    userName.delegate = self;
    
    //    _ageTextField.text = @"입력하기";
    _ageTextField.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:1];
    _ageTextField.delegate = self;
    
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
    
    
    
    // memberData init
    self.memberData = [[MemberData alloc]init];
    
}

- (void) saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    SWMMember *mem = [self.memberData exportToSWMMember];
    [defaults setObject:[mem description] forKey:@"forPersonalInfor"];
    
    [defaults synchronize];
}


- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    userName.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
    _ageTextField.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    
    if(textView.text.length == 0){
        textView.textColor = [UIColor colorWithRed:237/255.0 green:103/255.0 blue:103/255.0 alpha:10000];
        textView.text = @"";
        [textView resignFirstResponder];
    }
}

- (void) refreshHouseData
{
    
    
    /* 수요자측 데이터 - 수요자 이름, 수요자 나이, 수요자 성별, 수요자 직업 뿌리기
     
     이름, 나이는 페이스북 세션 정보 통해 미리 세팅
     */
    
    
    if (_memberData.name != nil) {
        self.userName.text = _memberData.name;
    }
    
    if (_memberData.age != nil) {
        self.ageTextField.text = _memberData.age;
    }
    
    if (_memberData.sex != nil) {
        if ([_memberData.sex isEqualToString:@"0"]) {
            [radiobutton1 setSelected:YES];
            [radiobutton2 setSelected:NO];
        } else if ([_memberData.sex isEqualToString:@"1"]) {
            [radiobutton2 setSelected:YES];
            [radiobutton1 setSelected:NO];
        }
    }
    
    if (_memberData.job != nil) {
        self.jobTitleLabel.text = _memberData.job;
    }
    
    
}

- (void)fillhouseData
{
    /* 기입한 정보(이름, 나이, 성별, 직업) 저장하기 */
    
    _memberData.name = self.userName.text;
    _memberData.age = self.ageTextField.text;
    if ([radiobutton1 isSelected] == YES) {
        _memberData.sex = @"0";
    } else if ([radiobutton2 isSelected] == NO) {
        _memberData.sex = @"1";
        
    }
    _memberData.job  = self.jobTitleLabel.text;
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
                self.man.textColor = [UIColor lightGrayColor];
            }
            else{
                if([radiobutton2 isSelected]==YES)
                {
                    [radiobutton1 setSelected:YES];
                    [radiobutton2 setSelected:NO];
                    self.man.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
                    self.woman.textColor = [UIColor lightGrayColor];
                } else {
                    [radiobutton1 setSelected:YES];
                    self.man.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
                }
            }
            
            break;
        case 1:
            if([radiobutton2 isSelected]==YES)
            {
                [radiobutton2 setSelected:NO];
                self.woman.textColor = [UIColor lightGrayColor];
            }
            else{
                if([radiobutton1 isSelected]==YES)
                {
                    [radiobutton2 setSelected:YES];
                    [radiobutton1 setSelected:NO];
                    self.woman.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
                    self.man.textColor = [UIColor lightGrayColor];
                } else {
                    [radiobutton2 setSelected:YES];
                    self.woman.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
                }
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
    jobTitleLabel.text = [jobsArray objectAtIndex:row];
    jobTitleLabel.textColor = [UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000];
    
    
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
    
    [self saveData];
    
    if ([[segue identifier] isEqualToString:@"goNext"])
    {
        RegisterViewController2 *vc = [segue destinationViewController];
        
        [self fillhouseData];
        /* 기입한 정보를 다음 뷰로 전달*/
        
        vc.memberData = _memberData;
        [self fillhouseData];
        
    }
}

@end
