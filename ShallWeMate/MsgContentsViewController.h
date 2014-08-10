//
//  MsgDetailViewController.h
//  start
//
//  Created by 컴038 on 8/1/14.
//  Copyright (c) 2014 컴038. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBubbleTableViewDataSource.h"

@interface MsgContentsViewController : UIViewController<UIBubbleTableViewDataSource>
{
    BOOL shareMode;
    
    
}
@property (strong, nonatomic) IBOutlet UILabel *providerNameLabel;
@property (strong, nonatomic) NSString *providerName;
@property UIImageView *providerImage;



@end
