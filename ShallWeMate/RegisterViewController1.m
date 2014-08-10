//
//  RegisterViewController1.m
//  start
//
//  Created by 컴038 on 7/15/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import "RegisterViewController1.h"

@implementation RegisterViewController1
@synthesize jobButton;
@synthesize fbProfilePictureView;
@synthesize userName;
@synthesize radiobutton1;
@synthesize radiobutton2;

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
    
    jobsArray = [[NSArray alloc] initWithObjects:@"학생", @"직장인", @"프리랜서", nil];
    
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    self.fbProfilePictureView.layer.cornerRadius = self.fbProfilePictureView.frame.size.width / 2;
    self.fbProfilePictureView.clipsToBounds = YES;
    fbProfilePictureView.profileID =appDelegate.fbUserId;
    userName.text = appDelegate.fbUserName;
    
    radiobutton1 = [[UIButton alloc] initWithFrame:CGRectMake(93, 267, 30, 30)];
    [radiobutton1 setTag:0];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
    [radiobutton1 setBackgroundImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateSelected];
    [radiobutton1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    radiobutton2 = [[UIButton alloc] initWithFrame:CGRectMake(183, 267, 30, 30)];
    [radiobutton2 setTag:1];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateSelected];
    [radiobutton2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:radiobutton1];
    [self.view addSubview:radiobutton2];
    //키보드 올라갈 때 뷰 올리기
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:self.view.window];
    
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
    return [jobsArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [jobButton setTitle:[jobsArray objectAtIndex:row] forState:UIControlStateNormal];
    
    //picker view 내리기
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    pickerView.transform = CGAffineTransformMakeTranslation(0, 275);
    [UIView commitAnimations];
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [jobsArray objectAtIndex:row];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
