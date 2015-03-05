//
//  ViewController.m
//  ScrollMenu
//
//  Created by Tim Geng on 3/5/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ViewController.h"

#import "ScrollMenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",@"eleven",@"twelve",@"thirteen", nil];
    ScrollMenuView *menu = [[ScrollMenuView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50) titles:array];
    [self.view addSubview:menu];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
