//
//  YSMenuProtocol.h
//  ShallWeMate
//
//  Created by Kim Junhyoung on 8/5/14.
//  Copyright (c) 2014 Kim Junhyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YSMenuProtocol <NSObject>

@optional
- (void)viewWillReduceFromLeft:(NSNumber *)fromLeft;
- (void)viewDidReduceFromLeft:(NSNumber *)fromLeft;
- (void)viewWillGrow;
- (void)viewDidGrow;

- (void)menuIsOpen;
- (void)menuIsClose;

@end
