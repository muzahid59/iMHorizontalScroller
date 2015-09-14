//
//  iMHorizontalScroller.h
//  iMHorizontalScroller
//
//  Created by Muzahidul Islam on 9/12/15.
//  Copyright (c) 2015 iMuzahid. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol iMHozontalScrollerDelegate;

@interface iMScroller : UIView

@property (nonatomic, weak) id<iMHozontalScrollerDelegate> delegate;

-(void)reload;
@end

@protocol iMHozontalScrollerDelegate <NSObject>

@required
-(NSUInteger)numberOfCellForTheiMScroller:(iMScroller *)iMScroller;
-(UIView *)iMScroller:(iMScroller *)iMScroller viewAtIndex:(NSUInteger)index;

@optional

@end
