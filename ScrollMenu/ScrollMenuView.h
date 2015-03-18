//
//  ScrollMenuView.h
//  ScrollMenu
//
//  Created by Tim Geng on 3/5/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollMenuView : UIView<UIScrollViewDelegate>

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

-(void)setInitSelected:(NSInteger)selectedIndex;

@end
