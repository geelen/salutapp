//
//  SALMainViewController.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALMainViewController.h"
#import <WebKit/WebKit.h>

@interface SALMainViewController () <NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *messageTextField;
@property (weak) IBOutlet WebView *contentWebView;

@end

@implementation SALMainViewController


- (void)loadView {
    [super loadView];
    
    [self.messageTextField.rac_textSignal subscribeNext:^(NSString *newName) {
        NSLog(@"%@", newName);
    }];
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSLog(@"Control text %@", self.messageTextField.stringValue);
}


@end
