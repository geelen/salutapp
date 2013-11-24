//
//  SALRoomModel.h
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

@class SALNetworkModel;

@interface SALRoomModel : NSObject

@property (nonatomic, strong) NSArray *members;
@property (nonatomic, strong) NSString *myName;

- (id)initWithNetworkModel:(SALNetworkModel *) network;
- (void)iJoinedRoom:(NSString *) myName;

@end
