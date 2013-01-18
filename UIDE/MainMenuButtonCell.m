//
//  MainMenuButtonCell.m
//  UIDE
//
//  Created by Pablo Ochoa on 1/17/13.
//  Copyright (c) 2013 UIDE. All rights reserved.
//

#import "MainMenuButtonCell.h"

@implementation MainMenuButtonCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:_image];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        _title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_title];
    }
    return self;
}

@end
