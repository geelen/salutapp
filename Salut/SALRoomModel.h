//
//  SALRoomModel.h
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALRoomModel : NSObject

@property (nonatomic, strong) NSArray *members;

- (void)addMember:(NSString *) member;
- (void)iJoinedRoom;

@end
