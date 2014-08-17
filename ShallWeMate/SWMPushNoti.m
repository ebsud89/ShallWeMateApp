//
//  SWMPushNoti.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMPushNoti.h"

@implementation SWMPushNoti

- (id) initWithDictionary : (NSDictionary *)inpDic {
    
    self = [self init];
    
    if (self != nil) {
        if (inpDic) {
            [self setValuesForKeysWithDictionary:inpDic];
        }
    }
    
    return self;
}

- (id)valueForUndefinedKey:(NSString *)key

{
    
    NSLog(@"undefined key : %@",key);
    
    return  nil;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key

{
    
    NSLog(@"undefined key : %@",key);
    
}

- (NSString *) description {
    return [NSString stringWithFormat:@"{\"pid\":\"%d\", \"mid\":\"%d\", \"text\":\"%@\", \"opt\":\"%d\", \"noti\":\"%d\", \"udid\":\"%@\"  ", _pid,_mid,_text,_opt, _noti, _udid];

}
@end
