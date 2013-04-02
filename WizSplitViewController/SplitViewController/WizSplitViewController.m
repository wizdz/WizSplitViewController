//
//  WizSplitViewController.m
//  WizSplitViewController
//
//  Created by dzpqzb on 13-3-21.
//  Copyright (c) 2013年 wiz.cn. All rights reserved.
//

#import "WizSplitViewController.h"

static const int WizSplitViewControllerMasterWidth = 320;
static const int WizSplitSpaceViewWidth = 4;

@interface WizSplitViewController ()
@property (nonatomic, strong) UIView* splitSpaceView;
@end

@implementation WizSplitViewController
@synthesize masterViewController  ;
@synthesize detailViewController ;
@synthesize viewControllers = _viewControllers;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (UIViewController*) masterViewController
{
    return [self.viewControllers objectAtIndex:0];
}

- (UIViewController*) detailViewController
{
    return [self.viewControllers objectAtIndex:1];
}

- (void) setViewControllers:(NSArray *)viewControllers
{
    NSAssert([viewControllers count] == 2, @"the childViewControllers count is not 2 , but is %d",[viewControllers count]);
    _viewControllers = viewControllers;
    [self layoutChildViewControllers];
    
}
- (CGRect) getCurrentRect
{
    CGRect rect = self.view.frame;
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        if (height > 768) {
            height = CGRectGetWidth([UIScreen mainScreen].bounds);
            width = CGRectGetHeight([UIScreen mainScreen].bounds);
        }
    }
    else
    {
        if (width > 768) {
            width = CGRectGetWidth([UIScreen mainScreen].bounds);
            height = CGRectGetHeight([UIScreen mainScreen].bounds);
        }
    }
    return CGRectSetSize(rect, CGSizeMake(width, height));
}
- (void) layoutChildViewControllers
{
    if ([self isViewLoaded]) {
        for (UIViewController* vc in _viewControllers) {
            [vc willMoveToParentViewController:self];
            [self addChildViewController:vc];
            [self.view addSubview:vc.view];
            [vc didMoveToParentViewController:self];
        }
        CGRect rect = self.view.frame;
        CGFloat width = CGRectGetWidth(rect);
        CGFloat height = CGRectGetHeight(rect);
        NSAssert(width > WizSplitViewControllerMasterWidth, @"the master viewcontroller width is too short");
        self.masterViewController.view.frame = CGRectMake(0.0, 0.0, WizSplitViewControllerMasterWidth, height);
        self.splitSpaceView.frame = CGRectMake(CGRectGetMaxX(self.masterViewController.view.frame), 0.0, WizSplitSpaceViewWidth, height);
        self.detailViewController.view.frame = CGRectMake(CGRectGetMaxX(self.splitSpaceView.frame), 0.0, width- WizSplitViewControllerMasterWidth, height);
        self.masterViewController.view.autoresizesSubviews = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin;
        self.detailViewController.view.autoresizesSubviews = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
}

- (id) initWithViewControllers:(NSArray*)viewControllers
{
    self = [super init];
    if (self) {
        [self setViewControllers:viewControllers];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.splitSpaceView) {
        self.splitSpaceView = [[UIView alloc] init];
        self.splitSpaceView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:self.splitSpaceView];
    }
    [self layoutChildViewControllers];
    
	// Do any additional setup after loading the view.
}
- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [UIView animateWithDuration:duration animations:^{
       self.masterViewController.view.frame = CGRectSetWidth(self.masterViewController.view.frame, WizSplitViewControllerMasterWidth);
    }];
}
- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    self.masterViewController.view.frame = CGRectSetWidth(self.masterViewController.view.frame, WizSplitViewControllerMasterWidth);
    
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   self.masterViewController.view.frame = CGRectSetWidth(self.masterViewController.view.frame, WizSplitViewControllerMasterWidth); 
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   self.masterViewController.view.frame = CGRectSetWidth(self.masterViewController.view.frame, WizSplitViewControllerMasterWidth);  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) shouldAutorotate
{
    return YES;
}
- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}
@end
