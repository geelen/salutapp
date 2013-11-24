//
//  SALRoomModelSpec.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALRoomModel.h"
#import "SALNetworkModel.h"

SpecBegin(SALRoomModel)

__block SALRoomModel *model;
__block id networkMock;

beforeEach(^{
    networkMock = [OCMockObject niceMockForClass:[SALNetworkModel class]];
    model = [[SALRoomModel alloc] initWithNetworkModel:networkMock];
    expect(model).toNot.beNil();
});

describe(@"when initialised", ^{
    it(@"should do a 💩", ^{
        expect(model.members).to.equal(@[@"LOL"]);
    });
    
    it(@"should add members", ^{
        [model addMember:@"LOLWAT"];
        
        expect(model.members).to.equal(@[@"LOL", @"LOLWAT"]);
    });
    
});

describe(@"when I join the room", ^{
    it(@"should wipe the members list", ^{
        [model iJoinedRoom];
        expect(model.members).to.equal(@[]);
    });
    
    it(@"should announce that I have arrived", ^{
        [[networkMock expect] broadcastJoin:[OCMArg any]];
        
        [model iJoinedRoom];
        [networkMock verify];
    });
});

SpecEnd
