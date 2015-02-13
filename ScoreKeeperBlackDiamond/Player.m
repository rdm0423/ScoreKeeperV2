//
//  Player.m
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/13/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "Player.h"

static NSString * const entriesKey = @"entries";

@implementation Player

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.name = dictionary[nameKey];
        self.score = dictionary[scoreKey];
    }
    return self;
}

- (NSDictionary *)entryDictionary {
    
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.name) {
        [entryDictionary setObject:self.name forKey:nameKey];
    }
    if (self.score) {
        [entryDictionary setObject:self.score forKey:scoreKey];
    }
    return entryDictionary;
}

@end
