//
//  ScoreTableViewCell.m
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/6/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ScoreTableViewCell.h"

@interface ScoreTableViewCell()

@property (nonatomic, strong) UILabel *scoreCount;
@property (nonatomic, strong) UITextField *nameInput;
@property (nonatomic, strong) UIStepper *scoreStepper;
@property (nonatomic, strong) UINavigationItem *navigationItem;

@end

static CGFloat topMargin = 15;

@implementation ScoreTableViewCell

    
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        
        self.nameInput = [[UITextField alloc] initWithFrame:CGRectMake(15, topMargin, 150, 30)];
        self.nameInput.borderStyle = UITextBorderStyleBezel;
        self.nameInput.borderStyle = UITextBorderStyleRoundedRect;
        self.nameInput.placeholder = @"Input Name";
        [self.contentView addSubview:self.nameInput];
        
        self.scoreCount = [[UILabel alloc] initWithFrame:CGRectMake(190, topMargin, 30, 30)];
        [self.scoreCount setBackgroundColor:[UIColor cyanColor]];
        self.scoreCount.text = @"0";
        self.scoreCount.textAlignment = NSTextAlignmentCenter;
        self.scoreCount.layer.cornerRadius = 5.0;
        self.scoreCount.layer.masksToBounds = YES;
        self.scoreCount.layer.borderWidth = 2;
        [self.contentView addSubview:self.scoreCount];
        
        self.scoreStepper = [[UIStepper alloc] initWithFrame:CGRectMake(250, topMargin, 50, 30)];
        self.scoreStepper.maximumValue = 1000;
        self.scoreStepper.minimumValue = -100;
        [self.scoreStepper addTarget:self action:@selector(scoreChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.scoreStepper];
        
        return self;
    }

- (void)scoreChange:(id)sender {
    double value = [self.scoreStepper value];
    self.scoreCount.text = [NSString stringWithFormat:@"%d", (int)value];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
