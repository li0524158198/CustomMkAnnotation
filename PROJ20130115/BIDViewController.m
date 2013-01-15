//
//  BIDViewController.m
//  PROJ20130115
//
//  Created by liweihua on 13-1-15.
//  Copyright (c) 2013年 liweihua. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
{
    BIDMapViewController *_mapViewController;
}
@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dic1=[NSDictionary dictionaryWithObjectsAndKeys:@"30.281843",@"latitude",@"120.102193",@"longitude",nil];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:@"30.290144",@"latitude",@"120.146696‎",@"longitude",nil];
    
    NSDictionary *dic3=[NSDictionary dictionaryWithObjectsAndKeys:@"30.248076",@"latitude",@"120.164162‎",@"longitude",nil];
    
    NSDictionary *dic4=[NSDictionary dictionaryWithObjectsAndKeys:@"30.425622",@"latitude",@"120.299605",@"longitude",nil];
    
    NSArray *array = [NSArray arrayWithObjects:dic1, dic2, dic3, dic4, nil];
    
    _mapViewController = [[BIDMapViewController alloc]initWithNibName:@"BIDMapViewController" bundle:nil];
    _mapViewController.delegate = nil;
    [self.view addSubview:_mapViewController.view];
    [_mapViewController.view setFrame:self.view.bounds];
    NSLog(@"%@",array);
    [_mapViewController resetAnnitations:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
