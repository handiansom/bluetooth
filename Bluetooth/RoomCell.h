//
//  RoomCell.h
//  Bluetooth
//
//  Created by john on 8/22/14.
//  Copyright (c) 2014 Banana Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleCounter.h"

@interface RoomCell : UICollectionViewCell
@property (nonatomic) UIImageView *logo;
@property (nonatomic) UILabel *name;
@property (nonatomic) UILabel *numberOfDeviceLabel;
@property (nonatomic) UIImageView *number;
@property (nonatomic) UIImageView *connection;
@property int numberOfDevices;

- (void)setLogoImage:(NSString*)logoName;
- (void)setStateImage:(NSString*)state;
@end
