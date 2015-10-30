//
//  ViewController.m
//  UIStackView
//
//  Created by archerzz on 15/10/28.
//  Copyright © 2015年 archerzz. All rights reserved.
//

#import "RootViewController.h"

static NSInteger const kRow = 5;
static NSInteger const kCol = 4;

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *mainStackView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOtherStackView];
}

- (void)createOtherStackView {
    
    
    // 创建一个普通的二维数组,其中有一个以[NSNull null]来占位
    id array[kRow][kCol] =  {@"C", @"+/-", @"%", @"/",
                             @"7", @"8", @"9", @"X",
                             @"4", @"5", @"6", @"-",
                             @"1", @"2", @"3", @"+",
                             @"0", [NSNull null], @".", @"="};
    
    
    // 循环
    for (int row = 0; row < kRow; row ++) {
        // 1. 初始化
        UIStackView *vStackView = [[UIStackView alloc] init];
        // 2. 设置相等填充
        vStackView.distribution = UIStackViewDistributionFillEqually;
        // 3. 设置间隔
        vStackView.spacing = 1;
        // 4. 设置为水平(默认为垂直)
        vStackView.axis = UILayoutConstraintAxisHorizontal;
        // 5. 添加到mainStackView,
        [self.mainStackView addArrangedSubview:vStackView];
        
        // 主要是用于当row为4的时候进行0这个按钮的布局
        UIStackView *hStackView = nil;
        // 记录当row为4的时候,StackView添加子视图的数量
        int count = 0;
        
        // 行
        for (int col = 0; col < kCol; col ++) {
            
            // 如果为[NSNull null],将count置为0,并且重新执行
            if ([array[row][col] isEqual:[NSNull null]]) {
                count = 0;
                continue;
            }
            // 创建按钮
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            // 设置标题
            [button setTitle:array[row][col] forState:UIControlStateNormal];
            // 设置颜色
            button.backgroundColor = [UIColor whiteColor];
            // 当行数为4的时候
            if (row == 4 ) {
                // 并且数量为0的时候,说明需要创建一个新的StackView
                if (count == 0) {
                    hStackView = [[UIStackView alloc] init];
                    hStackView.distribution = UIStackViewDistributionFillEqually;
                    hStackView.spacing = 1;
                    [vStackView addArrangedSubview:hStackView];
                }
                [hStackView addArrangedSubview:button];
                count ++;
            } else {
                [vStackView addArrangedSubview:button];
            }
        }
    }
    
}



@end



















