//
//  LOCollectionRV.m
//  WordNote
//
//  Created by 童浩 on 15/9/24.
//  Copyright © 2015年 Yoni. All rights reserved.
//

#import "LOCollectionRV.h"

@implementation LOCollectionRV
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllView:frame];
    }
    return self;
}
- (void)addAllView:(CGRect)frame
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,frame.size.width,frame.size.height)];
    _label.backgroundColor = [UIColor colorWithRed:2 / 255.0 green:4 / 255.0 blue:33 / 255.0 alpha:0.1];
    [self addSubview:_label];
}
@end
