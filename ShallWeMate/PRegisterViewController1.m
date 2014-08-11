//
//  PRegisterViewController1.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController1.h"
#import "PRegisterViewController2.h"

@interface PRegisterViewController1 ()

@end

@implementation PRegisterViewController1

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
    housedata = [[HouseData alloc]init];
    
 
//    self.navigationController.textInputMode = [UITextInputMode activeInputModes];
    
    [self fillhouseData];
    
    
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
    NSLog(@"height : %f", height);
    if (movedUp)
    {
//        rect.origin.y -= height;
//        rect.size.height += height;
        rect.origin.y -= 120;
        rect.size.height += 120;
    }
    else
    {
//        rect.origin.y += height;
//        rect.size.height -= height;
        rect.origin.y += 120;
        rect.size.height -= 120;
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

- (void) refreshHouseData
{
    if (housedata.title != nil) {
        self.houseTitleTextField.text = housedata.title;
    }
    
    if (housedata.transportation != nil) {
        self.subwaySearchBtn.titleLabel.text = housedata.nearSubwayStation;
    }
    
    if (housedata.transportation != nil) {
        NSLog(@"걸어서");
    }
    
    if (housedata.transportationMinutes != nil) {
        self.subwayMinutesTextFiled.text = housedata.transportationMinutes;
    }
    
    if (housedata.introHouse != nil) {
        self.introHouse.text = housedata.introHouse;
    }
}

- (void)fillhouseData
{
    housedata.title = self.houseTitleTextField.text;
    housedata.nearSubwayStation = self.subwaySearchBtn.titleLabel.text;
    housedata.transportation = @"걸어서";
    housedata.transportationMinutes = self.subwayMinutesTextFiled.text;
    housedata.introHouse = self.introHouse.text;
}


// subway delegate
- (void) didSelectedSubwayStation:(NSString *) text
{
    self.subwaySearchBtn.titleLabel.text = text;
}

- (IBAction)imagePickerTouched:(id)sender {
    
    NSLog(@"dakfjdsovj");
    UIActionSheet *myActionSheet;
    myActionSheet = [[UIActionSheet alloc]initWithTitle:@"선택하세요" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"take Picture" otherButtonTitles:@"사진첩에서 고르기", nil];
    
    [myActionSheet showInView:self.view];
    


}

-(IBAction)selectPhoto:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==0)
    {
        NSLog(@"사진 찍기");
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
        else
        {
            [self takePhoto:nil];
        }
        
    }
    else if (buttonIndex ==1)
    {
        NSLog(@"사진 고르기");
        [self selectPhoto:nil];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.houseImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
    
    if ([[segue identifier] isEqualToString:@"searchSubway"]) {
        SWMSubwayViewController *vc = [segue destinationViewController];
        vc.delegate = self;
    }
    else if ([[segue identifier] isEqualToString:@"goNext"])
    {
        PRegisterViewController2 *vc = [segue destinationViewController];
        vc.houseData = housedata;
        [self fillhouseData];
        
    }
}


@end
