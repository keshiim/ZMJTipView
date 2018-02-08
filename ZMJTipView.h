//
//  ZMJTipView.h
//  ZMJTipView
//
//  Created by Jason on 2018/2/8.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZMJArrowPosition) {
    ZMJArrowPosition_any = 0,
    ZMJArrowPosition_top,
    ZMJArrowPosition_bottom,
    ZMJArrowPosition_right,
    ZMJArrowPosition_left,
};

@interface ZMJAnimating
@property (nonatomic, assign) CGAffineTransform *dissmissTransform;
@property (nonatomic, assign) CGAffineTransform *showInitialTransform;
@property (nonatomic, assign) CGAffineTransform *showFinalTransform;
@property (nonatomic, assign) CGFloat springDamping; //阻尼率
@property (nonatomic, assign) CGFloat springVelocity;//及速率
@property (nonatomic, assign) CGFloat showInitialAlpha;
@property (nonatomic, assign) CGFloat dismissFinalAlpha;
@property (nonatomic, assign) CGFloat showDuration;
@property (nonatomic, assign) CGFloat dismissDuration;
@property (nonatomic, assign) BOOL dismissOnTap;
@end

@interface ZMJPositioning
@property (nonatomic, assign) CGFloat bubbleHInset;
@property (nonatomic, assign) CGFloat bubbleVInset;
@property (nonatomic, assign) CGFloat textHInset;
@property (nonatomic, assign) CGFloat textVInset;
@property (nonatomic, assign) CGFloat maxWidth;
@end

@interface ZMJDrawing
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat arrowHeight;
@property (nonatomic, assign) CGFloat arrowWidth;
@property (nonatomic, strong) UIColor *foregroundColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) ZMJArrowPosition arrowPostion;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIFont  *font;
@end

@interface ZMJPreferences

@end

@interface ZMJTipView : UIView

@end
