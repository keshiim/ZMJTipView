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

@class ZMJTipView, ZMJPreferences, ZMJDrawing, ZMJPositioning, ZMJAnimating;
@protocol ZMJTipViewDelegate;

@protocol ZMJTipViewDelegate
- (void)tipViewDidDimiss:(ZMJTipView *)tipView;
@end

@interface ZMJAnimating : NSObject
@property (nonatomic, assign) CGAffineTransform dissmissTransform;
@property (nonatomic, assign) CGAffineTransform showInitialTransform;
@property (nonatomic, assign) CGAffineTransform showFinalTransform;
@property (nonatomic, assign) CGFloat springDamping; //阻尼率
@property (nonatomic, assign) CGFloat springVelocity;//及速率
@property (nonatomic, assign) CGFloat showInitialAlpha;
@property (nonatomic, assign) CGFloat dismissFinalAlpha;
@property (nonatomic, assign) CGFloat showDuration;
@property (nonatomic, assign) CGFloat dismissDuration;
@property (nonatomic, assign) BOOL dismissOnTap;
@end

@interface ZMJPositioning : NSObject
@property (nonatomic, assign) CGFloat bubbleHInset;
@property (nonatomic, assign) CGFloat bubbleVInset;
@property (nonatomic, assign) CGFloat textHInset;
@property (nonatomic, assign) CGFloat textVInset;
@property (nonatomic, assign) CGFloat maxWidth;
@end

@interface ZMJDrawing : NSObject
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat arrowHeight;
@property (nonatomic, assign) CGFloat arrowWidth;
@property (nonatomic, strong) UIColor *foregroundColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) ZMJArrowPosition arrowPosition;
@property (nonatomic, assign) NSTextAlignment  textAlignment;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIFont  *font;
@end

@interface ZMJPreferences : NSObject
@property (nonatomic, strong) ZMJDrawing     *drawing;
@property (nonatomic, strong) ZMJPositioning *positioning;
@property (nonatomic, strong) ZMJAnimating   *animating;
@property (nonatomic, assign) BOOL hasBorder;
@end

@interface ZMJTipView : UIView
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithText:(NSString *)text preferences:(ZMJPreferences *)preferences delegate:(id<ZMJTipViewDelegate>)delegate;

@property (nonatomic, strong) NSString *text;
@property (class, nonatomic, strong) ZMJPreferences *globalPreferences;
@property (nonatomic, strong, readonly) ZMJPreferences *preferences;
@end
