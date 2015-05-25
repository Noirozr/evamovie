
#import <QuartzCore/QuartzCore.h>


@interface PulsingHaloLayer : CALayer

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, assign) NSTimeInterval pulseInterval; 

@end
