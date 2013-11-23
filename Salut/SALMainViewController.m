//
//  SALMainViewController.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALMainViewController.h"
#import <WebKit/WebKit.h>
#import <IOBluetooth/IOBluetooth.h>

@interface SALMainViewController () <NSTextFieldDelegate, CBCentralManagerDelegate, CBPeripheralManagerDelegate, CBPeripheralDelegate>

@property (weak) IBOutlet NSTextField *messageTextField;
@property (weak) IBOutlet WebView *contentWebView;

@end

@implementation SALMainViewController {
    CBCentralManager *centralManager;
    CBPeripheralManager *peripheralManager;
}



- (void)loadView {
    [super loadView];
    
    self.contentWebView.frameLoadDelegate = self;
    self.messageTextField.delegate = self;
    
    [self.contentWebView.mainFrame loadHTMLString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"] encoding:NSUTF8StringEncoding error:NULL] baseURL:nil];
    
    centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];

}

- (void)controlTextDidEndEditing:(NSNotification *)notification {
//    [centralManager scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:@"C6F581BD-1211-447C-941F-A8B63DE61E37"]] options:@{CBCentralManagerScanOptionAllowDuplicatesKey: @YES}];
    
    [peripheralManager startAdvertising:@{CBAdvertisementDataServiceUUIDsKey: @"C6F581BD-1211-447C-941F-A8B63DE61E37",
                                          CBAdvertisementDataLocalNameKey: @"Something long really long"}];
    
    [self.contentWebView.windowScriptObject callWebScriptMethod:@"chatHappened" withArguments:@[ @"Alan", self.messageTextField.stringValue ]];
    self.messageTextField.stringValue = @"";
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    [self.contentWebView.windowScriptObject callWebScriptMethod:@"chatHappened" withArguments:@[ peripheral.name, RSSI ]];
    NSLog(@"peripheral: %@", peripheral);
    NSLog(@"advertisementData: %@", advertisementData);
    NSLog(@"RSSI: %@", RSSI);
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    NSLog(@"peripheral: %@", peripheral);

}


@end
