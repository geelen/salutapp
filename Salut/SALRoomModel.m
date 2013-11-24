//
//  SALRoomModel.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALRoomModel.h"

@interface SALRoomModel ()

@end

@implementation SALRoomModel

- (id)init {
	self = [super init];
    if (self == nil) return nil;
    
    self.members = @[@"LOL"];
    
    return self;
}

- (void)addMember:(NSString *) member {
    self.members = [self.members arrayByAddingObject:member];
}

- (void)iJoinedRoom {
    self.members = @[];
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
