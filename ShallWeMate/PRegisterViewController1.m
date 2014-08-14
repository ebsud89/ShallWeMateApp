//
//  PRegisterViewController1.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController1.h"
#import "PRegisterViewController2.h"
#import "CTAssetsPickerController.h"
#import "CTAssetsPageViewController.h"

@interface PRegisterViewController1 ()
<CTAssetsPickerControllerDelegate, UIPopoverControllerDelegate>

@property (nonatomic, copy) NSArray *assets;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UIPopoverController *popover;

@end

@implementation PRegisterViewController1
@synthesize houseImageScrollView;

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

- (void) initScrollView
{
    self.houseImageScrollView.scrollsToTop = YES;
    NSArray *subViews = [houseImageScrollView subviews];
    if (subViews != nil) {
        for (UIView *subView in subViews) {
            [subView removeFromSuperview];
        }
    }
    
    
    int count = (int) [self.assets count];
    
    
    for (int i=0; i<count; i++) {
        CGRect frame;
        frame.origin.x = houseImageScrollView.frame.size.width*i;
        frame.origin.y = 0;
        frame.size = houseImageScrollView.frame.size;
        
        ALAsset *asset = [self.assets objectAtIndex:i];
        
        // 원본이미지
        UIImage *myImage = [UIImage imageWithCGImage:asset.defaultRepresentation.fullResolutionImage];
        // 썸네일
//        UIImage *myImage = [UIImage imageWithCGImage:asset.thumbnail];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:myImage];
        imageView.frame = frame;
        [houseImageScrollView addSubview:imageView];
    }
    
    self.addPhotoBtn.frame = CGRectMake(houseImageScrollView.frame.size.width*count + 160, houseImageScrollView.frame.size.height/2, self.addPhotoBtn.frame.size.width, self.addPhotoBtn.frame.size.height);
    
    [houseImageScrollView addSubview:self.addPhotoBtn];
    
    houseImageScrollView.contentSize = CGSizeMake(houseImageScrollView.frame.size.width * (self.assets.count+1), houseImageScrollView.frame.size.height);
    
    [self.houseImageScrollView reloadInputViews];
    [self.houseImageScrollView setContentOffset:CGPointZero animated:YES];
}

- (IBAction)imagePickerTouched:(id)sender {
    
    NSLog(@"dakfjdsovj");
    UIActionSheet *myActionSheet;
    myActionSheet = [[UIActionSheet alloc]initWithTitle:@"선택하세요" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"take Picture" otherButtonTitles:@"사진첩에서 고르기", nil];
    
    [myActionSheet showInView:self.view];
    


}

-(IBAction)selectPhoto:(UIButton *)sender
{
    if (!self.assets)
        self.assets = [[NSMutableArray alloc] init];
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.assetsFilter         = [ALAssetsFilter allAssets];
    picker.showsCancelButton    = (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad);
    picker.delegate             = self;
    picker.selectedAssets       = [NSMutableArray arrayWithArray:self.assets];
    
    [self presentViewController:picker animated:YES completion:nil];

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

// 단일 이미지 피커...
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//    
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Popover Controller Delegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.popover = nil;
}


#pragma mark - Assets Picker Delegate

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker isDefaultAssetsGroup:(ALAssetsGroup *)group
{
    return ([[group valueForProperty:ALAssetsGroupPropertyType] integerValue] == ALAssetsGroupSavedPhotos);
}

// 뷰에서 선택 완료 한 후...
- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    if (self.popover != nil)
        [self.popover dismissPopoverAnimated:YES];
    else
        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    self.assets = [NSMutableArray arrayWithArray:assets];
    
    
    [self initScrollView];
    
    //    [self.tableView reloadData];
}


- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldEnableAsset:(ALAsset *)asset
{
    // Enable video clips if they are at least 5s
    if ([[asset valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo])
    {
        NSTimeInterval duration = [[asset valueForProperty:ALAssetPropertyDuration] doubleValue];
        return lround(duration) >= 5;
    }
    else
    {
        return YES;
    }
}

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(ALAsset *)asset
{
    if (picker.selectedAssets.count >= 10)
    {
        UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:@"Attention"
                                   message:@"Please select not more than 10 assets"
                                  delegate:nil
                         cancelButtonTitle:nil
                         otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    
    if (!asset.defaultRepresentation)
    {
        UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:@"Attention"
                                   message:@"Your asset has not yet been downloaded to your device"
                                  delegate:nil
                         cancelButtonTitle:nil
                         otherButtonTitles:@"OK", nil];
        
        [alertView show];
    }
    
    return (picker.selectedAssets.count < 10 && asset.defaultRepresentation != nil);
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
