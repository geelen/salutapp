//
//  SALRoomModelSpec.m
//  Salut
//
//  Created by Glen Maddern on 23/11/2013.
//  Copyright (c) 2013 Glen Maddern. All rights reserved.
//

#import "SALRoomModel.h"

SpecBegin(SALRoomModel)

describe(@"when initialised", ^{
   
    it(@"should do a 💩", ^{
        SALRoomModel *model = [[SALRoomModel alloc] init];
        expect(model).toNot.beNil();
    });
    
});

SpecEnd
