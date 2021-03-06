//
//  RoomCell.m
//  Bluetooth
//
//  Created by john on 8/22/14.
//  Copyright (c) 2014 Banana Technology. All rights reserved.
//

#import "RoomCell.h"

@implementation RoomCell

- (instancetype)initWithFrame:(CGRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.0];
        
        self.logo = [[RoomLogoButton alloc]initWithFrame:CGRectMake(15, 20, 35, 35)];
        [self.contentView addSubview:self.logo];

        self.name = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 320, 80)];
        self.name.textAlignment = NSTextAlignmentLeft;
        self.name.font = [UIFont fontWithName:@"GillSans-Light" size:20.0];
        self.name.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.name];
        self.numberOfDevices = 0;
        
        UIImage *image = [UIImage imageNamed:@"number-device"];
        self.numberOfDeviceImage = [[UIImageView alloc]initWithFrame:CGRectMake(200,30,20,20)];
        self.numberOfDeviceImage.image = image;
        self.numberOfDeviceImage.contentMode = UIViewContentModeScaleAspectFit;
        
        self.numberOfDeviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(207,30,20,20)];
        self.numberOfDeviceLabel.text = [NSString stringWithFormat:@"%d", self.numberOfDevices];
        self.numberOfDeviceLabel.textColor = [UIColor whiteColor];
        self.numberOfDeviceLabel.font = [UIFont fontWithName:@"GillSans-Light" size:10.0];
        
        
    }
    return self;
}

- (void)setLogoImage:(NSString *)logoName
{
    UIImage *logoImage;
    if ([logoName isEqualToString:@"LivingRoom"])
    {
        logoImage = [UIImage imageNamed:@"livingroom"];
    }
    else if ([logoName isEqualToString:@"Bathroom"])
    {
        logoImage = [UIImage imageNamed:@"bathroom"];
    }
    else if ([logoName isEqualToString:@"Kitchen"])
    {
        logoImage = [UIImage imageNamed:@"kitchen"];
    }
    else if ([logoName isEqualToString:@"Bedroom"])
    {
        logoImage = [UIImage imageNamed:@"bedroom"];
    }
    else if ([logoName isEqualToString:@"nextBulb-mega"])
    {
        logoImage = [UIImage imageNamed:@"lightbulb_on"];
    }
    else if ([logoName isEqualToString:@"nextBulb-nano"])
    {
        logoImage = [UIImage imageNamed:@"lightbulb_on"];
    }
    else if ([logoName isEqualToString:@"nextBulb"])
    {
        logoImage = [UIImage imageNamed:@"lightbulb_on"];
    }
    else if ([logoName isEqualToString:@"nextDuino"])
    {
        logoImage = [UIImage imageNamed:@"nextDuino"];
    }

    [self.logo setBackgroundImage:logoImage forState:UIControlStateNormal];
    self.logo.contentMode = UIViewContentModeScaleAspectFit;

}

- (void)setStateImage:(NSString*)state
{
    UIImage *logoImage;
    if ([state isEqualToString:@"Connected"]) {
        [self.connection removeFromSuperview];
        [self.numberOfDeviceImage removeFromSuperview];
        [self.numberOfDeviceLabel removeFromSuperview];
        self.connection = [[UIImageView alloc]initWithFrame:CGRectMake(250,17,50,50)];
        self.connection.contentMode = UIViewContentModeScaleAspectFit;
        logoImage = [UIImage imageNamed:@"connected"];
        self.connection.image = logoImage;
    }
    else if ([state isEqualToString:@"Connecting"]) {
        [self.connection removeFromSuperview];
        [self.numberOfDeviceLabel removeFromSuperview];
        self.connection = [[UIImageView alloc]initWithFrame:CGRectMake(250,17,50,50)];
        self.connection.contentMode = UIViewContentModeScaleAspectFit;
        logoImage = [UIImage imageNamed:@"connecting"];
        self.connection.image = logoImage;
    }
    else if ([state isEqualToString:@"Disconnected"]) {
        [self.connection removeFromSuperview];
        [self.numberOfDeviceLabel removeFromSuperview];
        self.connection = [[UIImageView alloc]initWithFrame:CGRectMake(250,17,50,50)];
        self.connection.contentMode = UIViewContentModeScaleAspectFit;
        logoImage = [UIImage imageNamed:@"disconnected"];
        self.connection.image = logoImage;
    }
    else {
        [self.connection removeFromSuperview];
        [self.contentView addSubview:self.numberOfDeviceImage];
        [self.contentView addSubview:self.numberOfDeviceLabel];
        self.connection = [[UIImageView alloc]initWithFrame:CGRectMake(250,17,50,50)];
        self.connection.contentMode = UIViewContentModeScaleAspectFit;
        logoImage = [UIImage imageNamed:@"connected2"];
        self.connection.image = logoImage;
    }
    [self.contentView addSubview:self.connection];
}

-(void)setNumberOfDevice:(NSUInteger)number
{
    self.numberOfDeviceLabel.text = [NSString stringWithFormat:@"%lu", number];

}

@end
