//
//  PRegisterViewController1.m
//  start
//
//  Created by 컴049 on 2014. 7. 13..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "PRegisterViewController1.h"
#import "PRegisterViewController2.h"
#import "BrandRegisterViewController.h"
#import "CTAssetsPickerController.h"
#import "CTAssetsPageViewController.h"
#import "UIImage+ResizeMagick.h"

@interface PRegisterViewController1 ()
<CTAssetsPickerControllerDelegate, UIPopoverControllerDelegate>

@property (nonatomic, copy) NSArray *assets;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UIPopoverController *popover;

@end

@implementation PRegisterViewController1
@synthesize houseImageScrollView;
@synthesize textView;

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
    _housedata = [[HouseData alloc]init];
 
//    self.navigationController.textInputMode = [UITextInputMode activeInputModes];
    
    [self fillhouseData];
    
    //text관련
    self.houseTitleTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"쉐어하우스에 이름을 붙여주세요." attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0]}];
   
    //줄간격
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.headIndent = 0; // <--- indention if you need it
    style.firstLineHeadIndent = 0;
    style.lineSpacing = 3;
    textView.attributedText = [[NSAttributedString alloc]
                               initWithString:@"Predefined Text"
                               attributes:@{NSParagraphStyleAttributeName : style}];
    textView.text = @"쉐어하우스의 특징이 잘 나타나도록\n50자 이내로 설명해주세요.";
    textView.textColor = [UIColor colorWithRed:175.0/255.0 green:175.0/255.0 blue:175.0/255.0 alpha:1.0];
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:15];
    
    //키보드 올라갈 때 뷰 올리기
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillHideNotification object:self.view.window];
    
    //cursor coloer
    [[UITextField appearance] setTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1.0]];
    
    //navigation bar hidden
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    //navigation bar color
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:237.0/255.0 green:103.0/255.0 blue:103.0/255.0 alpha:1000]];
    [[[self navigationController] navigationBar] setBackgroundColor:[UIColor colorWithRed:174/255.0 green:70/255.0 blue:115/255.0 alpha:1]];
//    [[[self navigationController] navigationBar] setTranslucent:YES];
    
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yourimage.png"]];
    [self initScrollView];
    [self refreshHouseData];
}


- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
    return YES;
}

- (void)setViewMovedUp:(BOOL)movedUp height:(float)height

{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y -= 200;
        rect.size.height += 200;
    }
    else
    {
        rect.origin.y += 200;
        rect.size.height -= 200;
    }
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
    
}

//- (IBAction)backButtonClicked:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}

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
    if (_housedata.title != nil) {
        self.houseTitleTextField.text = _housedata.title;
    }
    
    if (_housedata.nearSubwayStation != nil) {
        self.subwaySearchBtn.titleLabel.text = _housedata.nearSubwayStation;
    }
    
    if (_housedata.transportation != nil) {
        NSLog(@"걸어서");
    }
    
    if (_housedata.transportationMinutes != nil) {
        self.subwayMinutesTextFiled.text = _housedata.transportationMinutes;
    }
    
    if (_housedata.introHouse != nil) {
        self.introHouse.text = _housedata.introHouse;
    }
    
    if (self.premiumBrandName != nil) {
        self.premiumBrand.titleLabel.text = _premiumBrandName;
        
        
    }
}

- (void)fillhouseData
{
    _housedata.title = self.houseTitleTextField.text;
    _housedata.nearSubwayStation = self.subwaySearchBtn.titleLabel.text;
    _housedata.transportation = @"걸어서";
    _housedata.transportationMinutes = self.subwayMinutesTextFiled.text;
    _housedata.introHouse = self.introHouse.text;
    _housedata.premium = self.premiumBrandName;
}


// subway delegate
- (void) didSelectedSubwayStation:(NSDictionary *) subwayDic
{
    
    //    self.subwaySearchBtn.titleLabel.text = [subwayDic objectForKey:@"전철역명"];
    self.stationLabel.text = [subwayDic objectForKey:@"전철역명"];
    [self.subwaySearchBtn setBackgroundColor:[UIColor whiteColor]];
    self.subwaySearchBtn.frame= CGRectMake(17.0, 170.0, 74.0, 29.0);
    self.housedata.subwayDic = subwayDic;
    
    [self.subwaySearchBtn reloadInputViews];
    self.subwaySearchBtn.hidden=TRUE;
    //역 아이콘
    //    self.stationImg.hidden=FALSE;
    self.stationLabel.text = [subwayDic objectForKey:@"전철역명"];
    UIImage* img = [UIImage imageNamed:@"o.png"];
    [self.stationImg setImage:img];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //initData
    [self brandSetting];
}

-(void)brandSetting {
    SWMAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    if (appDelegate.brand != nil) {
        self.brandName.text = appDelegate.brand;
        UIImage* img = [UIImage imageNamed:@"등록완료.png"];
        [self.premiumBrand setImage:img forState:UIControlStateNormal];
    }
}

- (void) initScrollView
{
//    self.houseImageScrollView.scrollsToTop = YES;
//    houseImageScrollView.directionalLockEnabled = YES;
//    [self.houseImageScrollView setContentOffset:CGPointZero animated:YES];
    NSArray *subViews = [houseImageScrollView subviews];
    if (subViews != nil) {
        for (UIView *subView in subViews) {
            [subView removeFromSuperview];
        }
    }
//    houseImageScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"photo2.png"]];
    
    int count = (int) [self.assets count];
    
    CGSize sacleSize = CGSizeMake(320, 210);
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
        NSLog(@"%f, %f", imageView.frame.origin.x, imageView.frame.origin.y);
    }
    NSLog(@"size %f", houseImageScrollView.frame.size);
//
//    self.addPhotoBtn.frame = CGRectMake(320*count, self.addPhotoBtn.frame.origin.y, self.addPhotoBtn.frame.size.width, self.addPhotoBtn.frame.size.height);
    self.addPhotoBtn.frame = CGRectMake(320*count, 0, 320, 210);
    
//    CGSize sacleSize = CGSizeMake(320, 210);
//    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
//    [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
//    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    

//    [self.addPhotoBtn setBackgroundImage:squareImage forState:UIControlStateNormal];
    
    
//    if (count == 0) {
//    [/*houseImageScrollView*/self.view addSubview:self.a	ddPhotoBtn];
     [houseImageScrollView addSubview:self.addPhotoBtn];
//    }
    houseImageScrollView.contentSize = CGSizeMake(houseImageScrollView.frame.size.width * (self.assets.count+1), houseImageScrollView.frame.size.height);
    
    NSLog(@"%f , %f", houseImageScrollView.contentSize.width, houseImageScrollView.contentSize.height   );
    
    [self.houseImageScrollView reloadInputViews];
//    if (count == 0) {
    
//        [self.houseImageScrollView setContentOffset:CGPointZero animated:YES];
//    } else {
//        
//        [self.houseImageScrollView setContentOffset:CGPointMake(0, 64) animated:YES];
//    }
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
        
        [self.view endEditing:YES];
    }
    else if ([[segue identifier] isEqualToString:@"goNext"])
    {
        PRegisterViewController2 *vc = [segue destinationViewController];
        vc.houseData = _housedata;
        [self fillhouseData];
        [self.housedata printAll];
        
    }
    else if ([[segue identifier] isEqualToString:@"brandRegister1"])
    {
        BrandRegisterViewController *vc = [segue destinationViewController];
        vc.houseData = _housedata;
        [self fillhouseData];
        
    }
}


@end
