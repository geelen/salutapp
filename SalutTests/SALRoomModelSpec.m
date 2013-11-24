//
//  SALRoomModelSpec.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALRoomModel.h"

SpecBegin(SALRoomModel)

__block SALRoomModel *model;

beforeEach(^{
    model = [[SALRoomModel alloc] init];
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
    beforeEach(^{
        [model iJoinedRoom];
    });
    
    it(@"should wipe the members list", ^{
        expect(model.members).to.equal(@[]);
    });
});

SpecEnd
