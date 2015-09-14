//
//  ViewController.m
//  iMHorizontalScroller
//
//  Created by Muzahidul Islam on 9/12/15.
//  Copyright (c) 2015 iMuzahid. All rights reserved.
//

#import "ViewController.h"
#import "iMScroller.h"

@interface ViewController ()<iMHozontalScrollerDelegate>
@property (nonatomic, strong) iMScroller *scroller;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scroller = [[iMScroller alloc]initWithFrame:CGRectMake(20, 50, 290, 120)];
    self.scroller.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scroller];
   
    self.scroller.delegate = self;
    [self.scroller reload];
    
}


-(NSUInteger)numberOfCellForTheiMScroller:(iMScroller *)iMScroller{
    return 10;
}
-(UIView *)iMScroller:(iMScroller *)iMScroller viewAtIndex:(NSUInteger)index{
    UIView *cell = [[UIView alloc]init];
    cell.backgroundColor = [UIColor redColor];
    return  cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
