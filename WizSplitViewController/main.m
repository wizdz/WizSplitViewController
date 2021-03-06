//
//  main.m
//  WizSplitViewController
//
//  Created by dzpqzb on 13-3-21.
//  Copyright (c) 2013年 wiz.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WizAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([WizAppDelegate class]));
    }
}

// From here to end of file added by Injection Plugin //

#ifdef DEBUG
static char _inMainFilePath[] = __FILE__;
static const char *_inIPAddresses[] = {"127.0.0.1", "192.168.10.86", NULL};

#define INJECTION_ENABLED
#import "/Applications/Injection Plugin.app/Contents/Resources/InjectionPlugin.xcplugin/Contents/Resources/BundleInjection.h"
#endif
