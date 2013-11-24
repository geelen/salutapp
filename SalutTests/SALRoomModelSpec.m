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
    it(@"should have some nonsense state", ^{
        expect(model.members).to.equal(@[@"LOL"]);
        expect(model.myName).to.equal(@"LOLOL");
    });

});

describe(@"when I join the room", ^{
    it(@"should wipe the members list", ^{
        [model iJoinedRoom:@"G-DOG"];
        expect(model.members).to.equal(@[]);
    });
    
    it(@"should announce that I have arrived", ^{
        [[networkMock expect] broadcastJoin:@"G-DOG"];
        
        [model iJoinedRoom:@"G-DOG"];
        [networkMock verify];
    });
});

SpecEnd
