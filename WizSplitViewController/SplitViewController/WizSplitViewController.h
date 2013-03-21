//
//  WizSplitViewController.h
//  WizSplitViewController
//
//  Created by dzpqzb on 13-3-21.
//  Copyright (c) 2013年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WizSplitViewController : UIViewController
@property (nonatomic, readonly) UIViewController* masterViewController;
@property (nonatomic, readonly) UIViewController* detailViewController;
@property (nonatomic, strong) NSArray* viewControllers;
- (id) initWithViewControllers:(NSArray*)viewControllers;

@end
