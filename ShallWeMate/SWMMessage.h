//
//  SWMMessage.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/17/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWMMessage : NSObject

@property int mid;
@property int fromid;
@property int toid;
@property (strong, nonatomic) NSString *text;

- (NSString *) description;

@end
