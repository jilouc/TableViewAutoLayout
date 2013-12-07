//
//  CCAViewController.m
//  TableViewAutoLayout
//
//  Created by Jean-Luc Dagon on 07/12/2013.
//  Copyright (c) 2013 Cocoapps. All rights reserved.
//

#import "CCAViewController.h"
#import "CCACustomCell.h"

@interface CCAViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_tableData;
    CCACustomCell *_stubCell;
}

@property (nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CCAViewController

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"CCACustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    
    _stubCell = [cellNib instantiateWithOwner:nil options:nil][0];
	
    _tableData = @[
                   @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sodales diam sed turpis mattis dictum. In laoreet porta eleifend. Ut eu nibh sit amet est iaculis faucibus.",
                   @"Mauris ullamcorper, elit sed condimentum posuere, augue dui vestibulum nulla, eu tempus velit lectus vitae mauris.",
                   @"Phasellus ut luctus arcu, in viverra mauris. Nulla a vehicula erat, vel tempus sapien. Etiam ornare tristique nisl eu vestibulum. Aliquam mollis, nisl eget accumsan semper, risus lectus rhoncus tortor, nec vehicula nisi nulla nec nibh.",
                   @"Donec et felis convallis, placerat ante sed, malesuada sem.",
                   @"Cras tristique eros et urna dapibus, non ullamcorper nisi gravida.",
                   @"Nunc elementum gravida est nec bibendum. In rhoncus justo id semper facilisis. Donec eget purus ac arcu elementum imperdiet.",
                   @"Aenean fermentum, odio eget laoreet blandit, nibh velit rhoncus turpis, vitae consectetur nunc metus ac neque.",
                   @"Nam in vehicula mi.",
                   ];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100000;;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureCell:_stubCell atIndexPath:indexPath];
    [_stubCell layoutSubviews];
    CGFloat height = [_stubCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height + 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.f;
}

- (void)configureCell:(CCACustomCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.customLabel.text = _tableData[indexPath.row % _tableData.count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCACustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

@end
