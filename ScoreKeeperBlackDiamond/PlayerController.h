//
//  PlayerController.h
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/13/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerController : NSObject

@property (nonatomic, strong, readonly) NSArray *players;

+ (PlayerController *)sharedInstance;

- (void)addEntry:(Player *)entry;
- (void)removeEntry:(Player *)entry;
- (void)replacePlayers:(Player *)oldEntry withPlayers:(Player *)newEntry;


@end
