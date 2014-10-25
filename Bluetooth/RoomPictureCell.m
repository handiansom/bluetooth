//
//  RoomPictureCell.m
//  Bluetooth
//
//  Created by john on 9/16/14.
//  Copyright (c) 2014 Banana Technology. All rights reserved.
//

#import "RoomPictureCell.h"

@implementation RoomPictureCell

- (instancetype)initWithFrame:(CGRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.isSelected = false;
        
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.imageView setImage: [UIImage imageNamed:@"Dashboard-Restroom"]];
        self.imageView.alpha = 0.4;
        [self addSubview:self.imageView];
        
        self.textLabel = [[UILabel alloc]initWithFrame:self.bounds];
        [self.textLabel setText:@"John's Room"];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont fontWithName:@"GillSans-Light" size:50.0];
        self.textLabel.alpha = 0.7;
        [self addSubview:self.textLabel];
    }
    return self;
}

- (void) setUnSelected {
    self.isSelected = false;
    self.imageView.alpha = 0.4;
    self.textLabel.alpha = 0.7;
}

- (void) setIsSelected {
    self.isSelected = true;
    self.imageView.alpha = 1;
    self.textLabel.alpha = 0.7;
}

- (void) setLabelName:(NSString*)name
{
    [self.textLabel setText:name];
}

- (void) setImage:(NSString*)imageName
{
    [self.imageView setImage:[UIImage imageNamed:imageName]];
}

@end
