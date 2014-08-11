//
//  CircleCounter.m
//  Color
//
//  Created by john on 7/7/14.
//  Copyright (c) 2014 Banana Technology. All rights reserved.
//

#import "CircleCounter.h"
@interface CircleCounter()
@property (nonatomic) double currentPosition;
@property (strong,nonatomic) UIButton *toogleButton;
@end

@implementation CircleCounter

- (void)setCurrentPosition:(double)currentPosition
{
    _currentPosition = currentPosition;

}

- (void)baseInit {
    
    
    self.toogleButton = [[UIButton alloc]initWithFrame:CGRectMake(115, 120, 110, 75)];
    [self.toogleButton setTitle:@"100%" forState:UIControlStateNormal];
    [self.toogleButton setTitleColor:JWG_CIRCLE_COLOR_DEFAULT forState:UIControlStateNormal];
    self.toogleButton.titleLabel.text = [NSString stringWithFormat:@"100%%"];
    self.toogleButton.titleLabel.font = [UIFont fontWithName:@"GillSans-Light" size:35.0];
    self.toogleButton.backgroundColor = [UIColor clearColor];
    [self addSubview:self.toogleButton];
    self.backgroundColor = [UIColor clearColor];
    self.circleColor = JWG_CIRCLE_COLOR_DEFAULT;
    self.circleBackgroundColor = JWG_CIRCLE_BACKGROUND_COLOR_DEFAULT;
    self.circleWidth = 30.0f;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)start
{
    self.currentPosition = 0.0;
    [self setNeedsDisplay];
}

- (void)incrementBy:(NSUInteger)amount
{
    if (self.currentPosition > 0) {
        self.currentPosition -= 0.02;
        int i = 100-(int)(self.currentPosition * 100);
        [self.toogleButton.titleLabel setText:[NSString stringWithFormat:@"%i%%",i]];
        [self setNeedsDisplay];
    }
}

- (void)decrementBy:(NSUInteger)amount
{
    if (self.currentPosition < 1){
        self.currentPosition += 0.02;
        int i = 100-(int)(self.currentPosition * 100);
        [self.toogleButton.titleLabel setText:[NSString stringWithFormat:@"%i%%",i]];
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    float radius = CGRectGetWidth(rect)/2.0f - self.circleWidth/2.0f;
    float angleOffset = M_PI_2;
    
    // Draw the background of the circle.
    CGContextSetLineWidth(context, self.circleWidth);
    CGContextBeginPath(context);
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    0,
                    2*M_PI,
                    0);
    CGContextSetStrokeColorWithColor(context, [self.circleBackgroundColor CGColor]);
    CGContextStrokePath(context);
    
    // Draw the remaining amount of timer circle.
    CGContextSetLineWidth(context, self.circleWidth);
    CGContextBeginPath(context);
    CGFloat startAngle = ((CGFloat)self.currentPosition*M_PI*2 - angleOffset);
    CGFloat endAngle = 2*M_PI - angleOffset;
    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    startAngle,
                    endAngle,
                    0);
    CGContextSetStrokeColorWithColor(context, [self.circleColor CGColor]);
    CGContextStrokePath(context);


//    NSLog(@"%f", self.currentPosition);
}


@end
