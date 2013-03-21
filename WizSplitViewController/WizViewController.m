//
//  WizViewController.m
//  WizSegmentViewController
//
//  Created by dzpqzb on 13-3-18.
//  Copyright (c) 2013年 wiz.cn. All rights reserved.
//

#import "WizViewController.h"

@interface WizViewController ()
@property (nonatomic, strong) UIView* rotationTestView;
@end

@implementation WizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = self.color;
    self.rotationTestView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)-20)];
    self.rotationTestView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.rotationTestView];
	// Do any additional setup after loading the view.
}
- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
   self.rotationTestView.frame = CGRectMake(10, 10, CGRectGetWidth(self.view.frame)-20, CGRectGetHeight(self.view.frame)-20);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
