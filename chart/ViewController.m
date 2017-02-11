//
//  ViewController.m
//  chart
//
//  Created by admin on 17/2/6.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "PNChart.h"
@interface ViewController ()<PNChartDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    [lineChart setXLabels:@[@"一月份",@"二月份",@"三月份",@"四月份",@"五月份"]];
    lineChart.showYGridLines = YES;
    lineChart.yGridLinesColor = [UIColor blackColor];
    lineChart.showCoordinateAxis = YES;
    lineChart.delegate = self;
    
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(57, 0, 1, 175)];
    lineView.backgroundColor = [UIColor redColor];
    [lineChart addSubview:lineView];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(187, 0, 1, 175)];
    lineView1.backgroundColor = [UIColor redColor];
    [lineChart addSubview:lineView1];
    
    //设置X,Y轴的颜色
    [lineChart setXLabelColor:[UIColor blackColor]];
    [lineChart setYLabelColor:[UIColor blackColor]];
    
    // Line Chart No.1
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"时间";
    data01.showPointLabel = YES;
    data01.pointLabelColor = [UIColor redColor];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    lineChart.chartData = @[data01, data02];
    [self.view addSubview:lineChart];
    [lineChart strokeChart];
//    lineChart.showSmoothLines = YES;
}

#pragma mark delegate
-(void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    
    
}
-(void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
