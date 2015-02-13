//
//  Player.h
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/13/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const nameKey = @"name";
static NSString * const scoreKey = @"score";

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *score;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;

@end
