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

@end
