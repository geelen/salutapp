//
//  SALRoomModel.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALRoomModel.h"
#import "SALNetworkModel.h"

@interface SALRoomModel ()

@property (nonatomic, strong) SALNetworkModel *network;

@end

@implementation SALRoomModel

- (id)initWithNetworkModel:(SALNetworkModel *) network {
	self = [super init];
    if (self == nil) return nil;
    
    self.members = @[@"LOL"];
    self.network = network;
    
    return self;
}

- (void)addMember:(NSString *) member {
    self.members = [self.members arrayByAddingObject:member];
}

- (void)iJoinedRoom {
    self.members = @[];
    [self.network broadcastJoin:@"MY NAME IS WHAT"];
}

// I joined room
//
// Broadcast that I joined

// Friend is already here
//
// Add them to my list
// Ask them for some history

// Friend joined room
//
// Add them to my list
// Tell them that I am here already

// Friend left room
//
// Remove them from my list

// I sent message
//
// Broadcast it & some history

// I received message
//
// Add it to my message state

@end
