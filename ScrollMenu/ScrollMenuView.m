//
//  ScrollMenuView.m
//  ScrollMenu
//
//  Created by Tim Geng on 3/5/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ScrollMenuView.h"

@interface ScrollMenuView ()

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) NSArray *menuContents;
@property(nonatomic,strong) UIView *indexView;
@end

@implementation ScrollMenuView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        self.scrollView.pagingEnabled = NO;
        //self.scrollView.backgroundColor = [UIColor greenColor];
        self.menuContents = titles;
        float beginX = 0;
        self.scrollView.delegate = self;
        //float contentSizeWidth = 0;
        for (int i = 0; i < titles.count; i++) {
            NSString *title = [titles objectAtIndex:i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

            [button setTitle:title forState:UIControlStateNormal];
            button.backgroundColor = [UIColor redColor];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
            button.tag = i;
            [button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside];
            UIFont *font = [UIFont fontWithName:@"Helvetica" size:20];
            NSDictionary *attribute = @{NSFontAttributeName: font};
      
            CGSize displayTitleSize = [title boundingRectWithSize:CGSizeMake(100, 50) options:NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
            button.frame = CGRectMake(beginX, 0, displayTitleSize.width, self.frame.size.height);
            beginX = beginX + displayTitleSize.width;
            NSLog(@"size = %@ ",NSStringFromCGRect(button.frame));
            [self.scrollView addSubview:button];
            if (i == 0) {
                self.indexView = [[UIView alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 3, displayTitleSize.width, 3)];
                self.indexView.backgroundColor = [UIColor greenColor];
                [self.scrollView addSubview:self.indexView];
                [self.scrollView bringSubviewToFront:self.indexView];
            }
           
            
        }
        self.scrollView.contentSize = CGSizeMake(beginX, self.frame.size.height);
        return self;
    }
    return self;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(IBAction)menuClicked:(id)sender{
    UIButton *button = (UIButton *)sender;
    [UIView animateWithDuration:0.5 animations:^{
        self.indexView.frame = CGRectMake(button.frame.origin.x, self.indexView.frame.origin.y, button.frame.size.width, self.indexView.frame.size.height);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
