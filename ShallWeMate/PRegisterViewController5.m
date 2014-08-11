//
//  PRegisterViewController5.m
//  start
//
//  Created by 컴049 on 2014. 7. 18..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController5.h"
#import "PRegisterViewController6.h"

@interface PRegisterViewController5 ()
@property (nonatomic, strong) UILabel *ageTitleLabel;
@end

@implementation PRegisterViewController5
@synthesize houseData;
@synthesize ageTitleLabel;

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
    
    avgAgesArray = [[NSArray alloc] initWithObjects:@"평균 연령을 선택해주세요", @"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
    
    // 버튼위에 라벨을 올려주기 위해 만듬
    ageTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(6.0f, 2.0f, 150.0f, 30.0f)];
    ageTitleLabel.textColor = [UIColor darkGrayColor];
    ageTitleLabel.textAlignment = NSTextAlignmentCenter;
    ageTitleLabel.backgroundColor = [UIColor clearColor];
    ageTitleLabel.font = [UIFont systemFontOfSize:14.0f];
    ageTitleLabel.lineBreakMode = NSLineBreakByClipping;
    [_avgAgeButton addSubview:ageTitleLabel];
    ageTitleLabel.text = [avgAgesArray objectAtIndex:0]; ;
    
    [_avgAgeButton addTarget:self action:@selector(selectAgeButtonClicked:)             forControlEvents:UIControlEventTouchUpInside];
    
    //키보드 올라갈 때 뷰 올리기
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    //cursor coloer
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
}


- (void)setViewMovedUp:(BOOL)movedUp height:(float)height

{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    
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

- (IBAction)selectAgeButtonClicked:(id)sender {
    
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
    return [avgAgesArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@",[avgAgesArray objectAtIndex:row] );
    ageTitleLabel.text = [avgAgesArray objectAtIndex:row];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [avgAgesArray objectAtIndex:row];
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
        PRegisterViewController6 *vc = [segue destinationViewController];
        vc.houseData = houseData;
    }
}


@end
