//
//  ScoreTableViewCell.h
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/6/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScoreTableViewCellDelegate;


@interface ScoreTableViewCell : UITableViewCell

@property (nonatomic, weak) id<ScoreTableViewCellDelegate>delegate;

@end

@protocol ScoreTableViewCellDelegate <NSObject>

//method
- (void)scoreTracker:(UILabel *)scoreCount cell:(ScoreTableViewCell *)cell;

@end
