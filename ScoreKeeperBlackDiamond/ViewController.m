//
//  ViewController.m
//  ScoreKeeperBlackDiamond
//
//  Created by Ross McIlwaine on 2/6/15.
//  Copyright (c) 2015 Ross McIlwaine. All rights reserved.
//

#import "ViewController.h"
#import "ScoreTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) int numberOfRows;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    self.numberOfRows = 1;
    
    self.title = @"Score Hero";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[ScoreTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addCell)];
    UIBarButtonItem *removeButton = [[UIBarButtonItem alloc] initWithTitle:@"-" style:UIBarButtonItemStylePlain target:self action:@selector(removeCell)];
    
    self.navigationItem.rightBarButtonItem = titleButton;
    self.navigationItem.leftBarButtonItem = removeButton;
    
}

- (ScoreTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.indexPathSelected = indexPath;
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:0.675 green:0.847 blue:0.961 alpha:1];
    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}

- (void)addCell {
    if (self.numberOfRows < 15) {
        self.numberOfRows++;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.numberOfRows - 1) inSection:0];
        
        NSArray *arrayAddCell = [NSArray arrayWithObject:indexPath];
        [self.tableView insertRowsAtIndexPaths:arrayAddCell withRowAnimation:(UITableViewRowAnimationMiddle)];
    }
}

- (void)removeCell {
    if (self.numberOfRows > 0) {
        self.numberOfRows--;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.numberOfRows) inSection:0];
        
        NSArray *arrayRemoveCell = [NSArray arrayWithObjects:indexPath, nil];
        [self.tableView deleteRowsAtIndexPaths:arrayRemoveCell withRowAnimation:(UITableViewRowAnimationMiddle)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
