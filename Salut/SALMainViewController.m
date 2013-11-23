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
    
    self.contentWebView.frameLoadDelegate = self;
    self.messageTextField.delegate = self;
    
    [self.contentWebView.mainFrame loadHTMLString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"] encoding:NSUTF8StringEncoding error:NULL] baseURL:nil];

}

- (void)controlTextDidEndEditing:(NSNotification *)notification {
    [self.contentWebView.windowScriptObject callWebScriptMethod:@"chatHappened" withArguments:@[ @"Alan", self.messageTextField.stringValue ]];
    self.messageTextField.stringValue = @"";
}


@end
