//
//  SWMMakeImageArray.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 22..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMMakeImageArray.h"

@implementation SWMMakeImageArray
- (NSMutableArray *) getImageArray:(int)rid
{
    NSMutableArray *arry = [[NSMutableArray alloc]init];
    
    if (rid<4) {
        for (int i= 0; i<3; i++) {
            NSString * myStr = [NSString stringWithFormat:@"Room%d%c.jpg", rid, 97+i];
            NSLog(@"%@", myStr);
            
            UIImage *img = [UIImage imageNamed:myStr];
            [arry addObject:img];
        }
    }
    else
    {
        NSString *myStr = [NSString stringWithFormat:@"Room%d.jpg", rid];
        NSLog(@"%@", myStr);
        
        UIImage *img = [UIImage imageNamed:myStr];
        [arry addObject:img];
    }
    
    
    return  arry;
}
@end
