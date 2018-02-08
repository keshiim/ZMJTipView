//
//  ZMJTipView.m
//  ZMJTipView
//
//  Created by Jason on 2018/2/8.
//

#import "ZMJTipView.h"


__unused static ZMJArrowPosition ZMJArrowPositionAllValues[4] = {
    ZMJArrowPosition_top,
    ZMJArrowPosition_bottom,
    ZMJArrowPosition_right,
    ZMJArrowPosition_left,
};

@implementation ZMJAnimating
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dissmissTransform    = CGAffineTransformMakeScale(.1, .1);
        _showInitialTransform = CGAffineTransformMakeScale(0, 0);
        _showFinalTransform   = CGAffineTransformIdentity;
        
        _springDamping  = 0.7;
        _springVelocity = 0.7;
        _showInitialAlpha = 0.f;
        _dismissFinalAlpha= 0.f;
        
        _showDuration    = 0.7;
        _dismissDuration = 0.7;
        _dismissOnTap    = YES;
    }
    return self;
}
@end

@implementation ZMJPositioning
- (instancetype)init
{
    self = [super init];
    if (self) {
        _bubbleHInset = 10.f;
        _bubbleVInset = 10.f;
        _textHInset = 10.f;
        _textVInset = 10.f;
        _maxWidth   = 200.f;
    }
    return self;
}
@end

@implementation ZMJDrawing
- (instancetype)init
{
    self = [super init];
    if (self) {
        _cornerRadius = 5.f;
        _arrowHeight  = 5.f;
        _arrowWidth   = 10.f;
        
        _foregroundColor = [UIColor whiteColor];
        _backgroundColor = [UIColor redColor];
        _arrowPostion    = ZMJArrowPosition_any;
        _textAlignment   = NSTextAlignmentCenter;
        _borderWidth = 0.f;
        _borderColor = [UIColor clearColor];
        _font        = [UIFont systemFontOfSize:15.f];
    }
    return self;
}
@end

@implementation ZMJPreferences
- (instancetype)init
{
    self = [super init];
    if (self) {
        _drawing = [ZMJDrawing new];
        _positioning = [ZMJPositioning new];
        _animating = [ZMJAnimating new];
    }
    return self;
}

- (BOOL)hasBorder {
    return self.drawing.borderWidth > 0 && [self.drawing.borderColor isEqual:[UIColor clearColor]];
}
@end

@interface ZMJTipView ()
@property (nonatomic, strong) UIView *presentingView;
@property (nonatomic, weak  ) id<ZMJTipViewDelegate> delegate;
@property (nonatomic, assign) CGPoint *arrowTip;
@property (nonatomic, strong) ZMJPreferences *preferences;

@end

@implementation ZMJTipView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// MARK:- Variables -
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (backgroundColor == nil || [backgroundColor isEqual:[UIColor clearColor]]) {
        return;
    }
    self.preferences.drawing.backgroundColor = backgroundColor;
    [super setBackgroundColor:[UIColor clearColor]];
}

- (NSString *)description {
    return [self debugDescription];
}

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"<<%@ with text: '%@'>>", NSStringFromClass([self class]), self.text];
}

+ (ZMJPreferences *)globalPreferences {
    static ZMJPreferences *_globalPreferences;
    if (_globalPreferences == nil) {
        _globalPreferences = [ZMJPreferences new];
    }
    return _globalPreferences;
}
@end
