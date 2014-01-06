//
//  ViewController.m
//  TableViewDelete
//
//  Created by SDT1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT1. All rights reserved.
//

#import "ViewController.h"

#define CELL_ID @"CELL_ID"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    NSMutableArray *data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = [[NSMutableArray alloc] initWithObjects: @"a", @"b", @"c", @"d", @"e", @"f", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 밀어서 셀삭제
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 데이터 삭제
    [data removeObjectAtIndex:indexPath.row];
    
    // 테이블 삭제
    NSArray *rows = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

// 셀개수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

// 셀생성하기, Dynamic Prototype 방식사용
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    
    return cell;
}

@end
