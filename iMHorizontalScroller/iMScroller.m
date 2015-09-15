//
//  iMHorizontalScroller.m
//  iMHorizontalScroller
//
//  Created by Muzahidul Islam on 9/12/15.
//  Copyright (c) 2015 iMuzahid. All rights reserved.
//

#import "iMScroller.h"



@interface iMScroller ()<UIScrollViewDelegate>{
    UIScrollView *scroller;
   // NSUInteger cellDimension;
}

@end

@implementation iMScroller
@synthesize cellPadding = _cellPadding;
@synthesize cellOffest = _cellOffest;
//@synthesize cellDimension = _cellDimension;
@synthesize cellHeight = _cellHeight;
@synthesize cellWidth = _cellWidth;
@synthesize delegate = _delegate;

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self defaulSettings];
        scroller = [[UIScrollView alloc]initWithFrame:self.bounds];
        scroller.delegate = self;
        [self addSubview:scroller];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnCell:)];
        [scroller addGestureRecognizer:tap];
        
    }
    
    return self;
}

#pragma mark- Default Settings
-(void)defaulSettings{
    self.cellPadding = 10;
    self.cellWidth = 100;
    self.cellHeight = 100;
    self.cellOffest = self.cellWidth;
   
}

-(void)tapOnCell:(UIGestureRecognizer *)tapGesture{
    CGPoint location = [tapGesture locationInView:tapGesture.view];
    for (int i = 0; i<[_delegate numberOfCellForTheiMScroller:self]; i++) {
        UIView *view = [[scroller subviews]objectAtIndex:i];
        if (CGRectContainsPoint(view.frame, location)) {
            [_delegate iMscroller:self didSelectAtIndex:i];
            [scroller setContentOffset:CGPointMake(view.frame.origin.x - self.frame.size.width/2 + view.frame.size.width/2, 0) animated:YES];
            break;
        }
    }
}

-(void)reload{
    
    if (self.delegate == nil) {
        return;
    }
    
    [scroller.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [obj removeFromSuperview];
    }];
    
    CGFloat xPos = _cellOffest;
    
    for (int index = 0; index< [self.delegate numberOfCellForTheiMScroller:self]; index ++) {
        xPos = xPos + _cellPadding;
        UIView *view = [self.delegate iMScroller:self viewAtIndex:index];
        view.frame = CGRectMake(xPos, _cellPadding, _cellWidth , _cellHeight);
        [scroller addSubview:view];
        xPos = xPos + _cellWidth + _cellPadding;
    }
    
    xPos = xPos + _cellOffest;
    
    [scroller setContentSize:CGSizeMake(xPos, self.frame.size.height)];
    
    //intial center view
    if ([_delegate respondsToSelector:@selector(intialViewIndex:)]) {
        NSUInteger index = [_delegate intialViewIndex:self];
        [scroller setContentOffset:CGPointMake(index*(_cellWidth+(2*_cellPadding)), 0)];
    }
}

-(void)viewGoesToCentreAfterEndScrolling{
    NSUInteger xFinal = scroller.contentOffset.x + (_cellOffest/2) + _cellPadding;
    NSUInteger viewIndex = xFinal / (_cellWidth+(2*_cellPadding));
    UIView *view = [[scroller subviews]objectAtIndex:viewIndex];
    [scroller setContentOffset:CGPointMake(view.frame.origin.x - self.frame.size.width/2 + view.frame.size.width/2, 0) animated:YES];
}


#pragma mark - UISCrollView Delegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
        [self viewGoesToCentreAfterEndScrolling];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
