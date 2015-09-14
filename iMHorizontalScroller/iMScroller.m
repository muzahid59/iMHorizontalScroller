//
//  iMHorizontalScroller.m
//  iMHorizontalScroller
//
//  Created by Muzahidul Islam on 9/12/15.
//  Copyright (c) 2015 iMuzahid. All rights reserved.
//

#import "iMScroller.h"

#define CELL_PADDING 10
#define CELL_OFFSET 100
#define CELL_DIMENSION 100

@interface iMScroller ()<UIScrollViewDelegate>{
    UIScrollView *scroller;
}

@end

@implementation iMScroller

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        scroller = [[UIScrollView alloc]initWithFrame:self.bounds];
        scroller.delegate = self;
        [self addSubview:scroller];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnCell:)];
        [scroller addGestureRecognizer:tap];

    }
    
    return self;
}


-(void)tapOnCell:(UIGestureRecognizer *)tapGesture{
    
}

-(void)reload{
    
    if (self.delegate == nil) {
        return;
    }
    
    [scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    CGFloat xPos = CELL_OFFSET;
    
    for (int index = 0; index< [self.delegate numberOfCellForTheiMScroller:self]; index ++) {
        xPos = xPos + CELL_PADDING;
        UIView *view = [self.delegate iMScroller:self viewAtIndex:index];
        view.frame = CGRectMake(xPos, CELL_PADDING, CELL_DIMENSION, CELL_DIMENSION);
        [scroller addSubview:view];
        xPos = xPos + CELL_DIMENSION + CELL_PADDING;
    }
    
    xPos = xPos + CELL_OFFSET;
    
    [scroller setContentSize:CGSizeMake(xPos, self.frame.size.height)];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
