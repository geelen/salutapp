//
//  SALAppDelegate.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALAppDelegate.h"
#import "SALMainViewController.h"

@interface SALAppDelegate ()

@property (nonatomic, strong) SALMainViewController *mainViewController;

@end

@implementation SALAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{ @"WebKitDeveloperExtras": @YES }];
    
    self.mainViewController = [[SALMainViewController alloc] initWithNibName:@"SALMainViewController" bundle:nil];
    
    self.mainViewController.view.frame = [self.window.contentView bounds];
    [self.window.contentView addSubview:self.mainViewController.view];
}

@end
