//
//  ZMJViewController.m
//  ZMJTipView
//
//  Created by keshiim on 02/08/2018.
//  Copyright (c) 2018 keshiim. All rights reserved.
//

#import "ZMJViewController.h"
#import <ZMJTipView/ZMJTipView.h>

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
    preferences.drawing.backgroundColor = [UIColor colorWithRed:.46 green:.99 blue:.6 alpha:1];
    
    ZMJTipView.globalPreferences = preferences;
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
        }];
    } else {
        NSString *text = @"EasyTipView is an easy to use tooltip view. It can point to any UIView or UIBarItem subclasses. Tap the buttons to see other tooltips.";
        ZMJTipView *tip = [[ZMJTipView alloc] initWithText:text preferences:nil delegate:self];
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
        
    } else if (sender == self.buttonC) {
        
    } else if (sender == self.buttonD) {
        
    } else if (sender == self.buttonE) {
        
    } else if (sender == self.buttonF) {
        
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
