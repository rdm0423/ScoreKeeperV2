//
//  PlayerController.m
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/13/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "PlayerController.h"
#import "Player.h"

static NSString * const entryListKey = @"entryList";

@interface PlayerController ()

@property (nonatomic, strong) NSArray *players;

@end

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PlayerController new];
        [sharedInstance loadFromDefualts];
    });
    return sharedInstance;
}

- (void)addEntry:(Player *)entry {
    
    if (!entry) {
        return;
    }
    NSMutableArray *mutablePlayers = [[NSMutableArray alloc] initWithArray:self.players];
    [mutablePlayers addObject:entry];
    self.players = mutablePlayers;
}

- (void)removeEntry:(Player *)entry {
    
    if (!entry) {
        return;
    }
    NSMutableArray *mutablePlayers = self.players.mutableCopy;
    [mutablePlayers removeObject:entry];
    self.players = mutablePlayers;
}

- (void)replacePlayers:(Player *)oldEntry withPlayers:(Player *)newEntry {
    
    if (!oldEntry || !newEntry) {
        return;
    }
    NSMutableArray *mutablePlayers = self.players.mutableCopy;
    if ([mutablePlayers containsObject:oldEntry]) {
        NSInteger index = [mutablePlayers indexOfObject:oldEntry];
        [mutablePlayers replaceObjectAtIndex:index withObject:newEntry];
    }
    self.players = mutablePlayers;
}


- (void)loadFromDefualts {
    
    NSArray *entryDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *players = [NSMutableArray new];
    for (NSDictionary *player in entryDictionary) {
        [players addObject:[[player alloc] initWithDictionary:player]];
    }
    self.players= players;
}

- (void)synchronize {
    
    NSMutableArray *entryDictionary = [NSMutableArray new];
    for (Player *player in self.players) {
        [entryDictionary addObject:[player entryDictionary]];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionary forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
