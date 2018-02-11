//
//  ZMJViewController.m
//  ZMJTipView
//
//  Created by keshiim on 02/08/2018.
//  Copyright (c) 2018 keshiim. All rights reserved.
//

#import "ZMJViewController.h"
#import <ZMJTipView/ZMJTipView.h>
#import "ZMJTaskView.h"
#import "UIView+Frame.h"
@import YYCategories;

@interface ZMJViewController () <ZMJTipViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *navBarItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolBarItem;
@property (weak, nonatomic) IBOutlet UIButton *buttonD;
@property (weak, nonatomic) IBOutlet UIButton *buttonE;
@property (weak, nonatomic) IBOutlet UIButton *buttonF;
@property (weak, nonatomic) IBOutlet UIView *smallContainer;
@property (weak, nonatomic) IBOutlet UIButton *buttonA;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIButton *buttonB;

@property (nonatomic, strong) ZMJTipView *tipView;
@end

@implementation ZMJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureUI];
 
    ZMJPreferences *preferences = [ZMJPreferences new];
    preferences.drawing.font = [UIFont fontWithName:@"Futura-Medium" size:13];
    preferences.drawing.foregroundColor = [UIColor whiteColor];
    preferences.drawing.backgroundColor = [UIColor colorWithHue:.46 saturation:.99 brightness:.6 alpha:1];
    
    ZMJTipView.globalPreferences = preferences;
    self.view.backgroundColor = [UIColor colorWithHue:0.75 saturation:0.01 brightness:0.96 alpha:1.00];
    [self.navigationController setToolbarHidden:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self toolBarButtonAction:nil];
}

- (void)tipViewDidDimiss:(ZMJTipView *)tipView {
    NSLog(@"%@ did dismiss!", tipView);
}

- (IBAction)barbuttonItemAction:(UIBarButtonItem *)sender {
    NSString *text = @"Tip view for bar button item displayed within the navigation controller's view. Tap to dismiss.";
    [ZMJTipView showAnimated:YES
                     forItem:self.navBarItem
             withinSuperview:self.navigationController.view
                        text:text
                 preferences:nil
                    delegate:self];
}

- (IBAction)toolBarButtonAction:(UIBarButtonItem *)sender {
    if (self.tipView) {
        [self.tipView dismissWithCompletion:^{
            NSLog(@"Completion called!");
            self.tipView = nil;
        }];
    } else {
        NSString *text = @"ZMJTipView is an easy to use tooltip view. It can point to any UIView or UIBarItem subclasses. Tap the buttons to see other tooltips.";
        ZMJTipView *tip = [[ZMJTipView alloc] initWithText:text preferences:nil delegate:self];
        tip.fakeView = ({
            ZMJTaskView *taskView = [ZMJTaskView new];
            taskView.width = tip.preferences.positioning.maxWidth;
            taskView.taskTitle = @"ZMJTipView show task!";
            taskView.startTime = @"2018-02-10 15:33:22";
            taskView.endTime = @"2019-02-10 15:33:22";
            taskView;
        });
        [tip showAnimated:YES forItem:self.toolBarItem withinSuperview:nil];
        self.tipView = tip;
    }
}

- (IBAction)buttonAction:(UIButton *)sender {
    if (sender == self.buttonA) {
        ZMJPreferences *preferences = [ZMJPreferences new];
        preferences.drawing.backgroundColor = [UIColor colorWithHue:.58 saturation:.1 brightness:1 alpha:1];
        preferences.drawing.foregroundColor = [UIColor darkGrayColor];
        preferences.drawing.textAlignment = NSTextAlignmentCenter;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(100, 0);
        preferences.animating.showInitialTransform =CGAffineTransformMakeTranslation(-100, 0);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1;
        preferences.animating.dismissDuration = 1;
        
        ZMJTipView *view = [[ZMJTipView alloc] initWithText:@"Tip view within the green superview. Tap to dismiss."
                                                preferences:preferences
                                                   delegate:nil];
        [view showAnimated:YES forView:_buttonA withinSuperview:self.smallContainer];

    } else if (sender == self.buttonB) {
        ZMJPreferences *preferences = ZMJTipView.globalPreferences;
        preferences.drawing.foregroundColor = [UIColor whiteColor];
        preferences.drawing.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        preferences.drawing.textAlignment = NSTextAlignmentJustified;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(0, -15);
        preferences.animating.showInitialTransform = CGAffineTransformMakeTranslation(0, 15);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1;
        preferences.animating.dismissDuration = 1;
        //            preferences.drawing.arrowPosition = .top
        
        NSString *text = @"Tip view inside the navigation controller's view. Tap to dismiss!";
        [ZMJTipView showAnimated:YES
                         forView:self.buttonB
                 withinSuperview:self.navigationController.view
                            text:text
                     preferences:preferences
                        delegate:nil];
    } else if (sender == self.buttonC) {
        ZMJPreferences *preferences = ZMJTipView.globalPreferences;
        preferences.drawing.backgroundColor = self.buttonC.backgroundColor;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(0, -15);
        preferences.animating.showInitialTransform = CGAffineTransformMakeTranslation(0, -15);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1.5;
        preferences.animating.dismissDuration = 1.5;
        //            preferences.drawing.arrowPosition = .top
        
        NSString *text = @"This tip view cannot be presented with the arrow on the top position, so position bottom has been chosen instead. Tap to dismiss!";
        [ZMJTipView showAnimated:YES
                         forView:self.buttonC
                 withinSuperview:self.navigationController.view
                            text:text
                     preferences:preferences
                        delegate:nil];
    } else if (sender == self.buttonD) {
        ZMJPreferences *preferences = ZMJTipView.globalPreferences;
//            preferences.drawing.arrowPosition = .bottom
        preferences.drawing.font = [UIFont systemFontOfSize:14.f];
        preferences.drawing.textAlignment = NSTextAlignmentCenter;
        preferences.drawing.backgroundColor = self.buttonD.backgroundColor;
        
        preferences.positioning.maxWidth = 130;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(100, 0);
        preferences.animating.showInitialTransform = CGAffineTransformMakeTranslation(100, 0);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1;
        preferences.animating.dismissDuration = 1;
        
        [ZMJTipView showAnimated:YES
                         forView:self.buttonD
                 withinSuperview:self.navigationController.view
                            text:@"Tip view within the topmost window. Tap to dismiss."
                     preferences:preferences
                        delegate:nil];
    } else if (sender == self.buttonE) {
        ZMJPreferences *preferences = [ZMJPreferences new];
        preferences.drawing.backgroundColor = self.buttonE.backgroundColor;
        preferences.drawing.foregroundColor = [UIColor whiteColor];
        preferences.drawing.textAlignment = NSTextAlignmentCenter;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(0, 100);
        preferences.animating.showInitialTransform = CGAffineTransformMakeTranslation(0, -100);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1;
        preferences.animating.dismissDuration = 1;
        
        preferences.positioning.maxWidth = 150;
        
        ZMJTipView *view = [[ZMJTipView alloc] initWithText:@"Tip view positioned with the arrow on the right. Tap to dismiss."
                                                preferences:preferences
                                                   delegate:nil];
        [view showAnimated:YES forView:self.buttonE withinSuperview:self.navigationController.view];
    } else if (sender == self.buttonF) {
        ZMJPreferences *preferences = [ZMJPreferences new];
        preferences.drawing.backgroundColor = self.buttonF.backgroundColor;
        preferences.drawing.foregroundColor = [UIColor whiteColor];
        preferences.drawing.textAlignment = NSTextAlignmentCenter;
        
        preferences.animating.dismissTransform = CGAffineTransformMakeTranslation(-30, -100);
        preferences.animating.showInitialTransform = CGAffineTransformMakeTranslation(30, 100);
        preferences.animating.showInitialAlpha = 0;
        preferences.animating.showDuration = 1;
        preferences.animating.dismissDuration = 1;
        preferences.animating.dismissOnTap = NO;
        
        preferences.positioning.maxWidth = 150;
        
        ZMJTipView *view = [[ZMJTipView alloc] initWithText:@"Tip view positioned with the arrow on the left. Tap won't dismiss."
                                                preferences:preferences
                                                   delegate:nil];
        [view showAnimated:YES forView:self.buttonF withinSuperview:self.navigationController.view];
    }
}

- (void)configureUI {
    UIColor *color = [UIColor colorWithHue:.46 saturation:.99 brightness:.6 alpha:1];
    self.buttonA.backgroundColor = [UIColor colorWithHue:.58 saturation:.1 brightness:1 alpha:1];
    self.navigationController.view.tintColor = color;
    
    self.buttonB.backgroundColor = color;
    self.smallContainer.backgroundColor = color;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
