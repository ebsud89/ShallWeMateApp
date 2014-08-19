//
//  SWMNSUserDefaultsTool.m
//  ShallWeMate
//
//  Created by 컴049 on 2014. 8. 19..
//  Copyright (c) 2014년 컴049. All rights reserved.
//

#import "SWMNSUserDefaultsTool.h"

@implementation SWMNSUserDefaultsTool

- (void) saveData:(id)object
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:object forKey:@"forSearchMemberData"];
    
    [defaults synchronize];
}

//- (id) loadData
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    id *fishList = [defaults objectForKey:@"fishList"];
//
//    return fishList;
//}
@end
