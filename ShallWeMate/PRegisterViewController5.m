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

@end

@implementation PRegisterViewController5
@synthesize houseData;

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
    
    avgAgesArray = [[NSArray alloc] initWithObjects:@"20대 초반", @"20대 중반", @"20대 후반", @"30대 초반", @"30대 중반", @"30대 후반", @"40대 이상", nil];
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

- (IBAction)selectAgeButtonClicked:(id)sender {
    
    actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self     cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0,40, 320, 216)];
    picker.showsSelectionIndicator=YES;
    picker.dataSource = self;
    picker.delegate = self;
    picker.tag = 0;
//    picker.tag=SelectedDropDown;
    [actionSheet addSubview:picker];
    
    UIToolbar *tools=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0,320,40)];
    tools.barStyle=UIBarStyleBlackOpaque;
    [actionSheet addSubview:tools];
    
    UIBarButtonItem *doneButton=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(btnActinDoneClicked)];
    doneButton.imageInsets=UIEdgeInsetsMake(200, 6, 50, 25);
    UIBarButtonItem *flexSpace= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *array = [[NSArray alloc]initWithObjects:flexSpace,doneButton,nil];
    
    [tools setItems:array];

    
    //picker title
    UILabel *lblPickerTitle=[[UILabel alloc]initWithFrame:CGRectMake(60,8, 200, 25)];
    lblPickerTitle.text=@"";
    lblPickerTitle.backgroundColor=[UIColor clearColor];
    lblPickerTitle.textColor=[UIColor whiteColor];
    lblPickerTitle.textAlignment=NSTextAlignmentCenter;
    lblPickerTitle.font=[UIFont boldSystemFontOfSize:15];
    [tools addSubview:lblPickerTitle];
    
    
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
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [avgAgesArray objectAtIndex:row];
}



-(void) btnActinDoneClicked
{
    NSString *str = [avgAgesArray objectAtIndex:[picker numberOfComponents]];
    self.avgAgeButton.titleLabel.text = str;
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
