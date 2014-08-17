//
//  SWMMessage.m
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import "SWMMessage.h"

@implementation SWMMessage

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
    return [NSString stringWithFormat:@"{\"mid\":\"%d\",\"fromid\":\"%d\", \"toid\":\"%d\", \"text\":\"%@\"  ", _mid, _fromid, _toid, _text ];
}
@end
