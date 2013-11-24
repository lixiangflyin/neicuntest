//
//  ViewController.m
//  neicuntest
//
//  Created by admin  on 13-11-23.
//  Copyright (c) 2013年 com.seuli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    NSLog(@"qretain = %d",[_testArr retainCount]);
//    NSMutableArray *arr = [[[NSMutableArray alloc]initWithObjects:@"a",@"b",@"c", nil]autorelease];
//    //_testArr = arr;
//    self.testArr = arr;
//    NSLog(@"Bretain = %d",[_testArr retainCount]);
//    //[_testArr retain];
//    //[arr release];
//    NSLog(@"Aretain = %d",[_testArr retainCount]);
//    NSLog(@"%@",_testArr);
    
//    [_testArr removeAllObjects];
//    NSLog(@"qretain = %d",[_testArr retainCount]);
//    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"家政",@"测试",@"销售", @"市场",@"产品",@"设计", nil];
//    //_testArr = arr;
//    self.testArr = arr;
//    NSLog(@"Bretain = %d",[_testArr retainCount]);
//    //[_testArr retain];
//    NSLog(@"Aretain = %d",[_testArr retainCount]);
//    //[_testArr removeAllObjects];
//    NSLog(@"%@",_testArr);
    
//    [_testArr removeAllObjects];
//    NSLog(@"qretain = %d",[_testArr retainCount]);
//    _testArr = [NSMutableArray arrayWithArray:[self getArray]];
//    //self.testArr = arr;
//    NSLog(@"Bretain = %d",[_testArr retainCount]);
//    //[_testArr retain];
//    NSLog(@"Aretain = %d",[_testArr retainCount]);
//    [_testArr removeAllObjects];
//    NSLog(@"%@",_testArr);
    
    _testArr = [[NSMutableArray alloc]init];
    //前一种计数值为1,后一种计数值为2,所以前一种会报内存错误，后一种正常
    [self.testArr addObjectsFromArray:[self getArray1]];
    //_testArr = [self getArray1];
    //self.testArr = [self getArray1];
    NSLog(@"%@",_testArr);
    NSLog(@"NewTestArr_retain = %d",[_testArr retainCount]);
    //[self.testArr removeAllObjects];
    //NSLog(@"%@",_testArr);
}

-(NSArray *)getArray
{
    //自动管理内存，出了这个函数，arr基本就释放了
    NSArray *arr = [[[NSArray alloc]initWithObjects:@"1",@"2",@"3", nil]autorelease];
    return arr;
}

-(NSMutableArray *)getArray1
{
    [self.testArr removeAllObjects];
    //自动管理内存，出了这个函数，arr基本就释放了
    NSMutableArray *arr = [[[NSMutableArray alloc]initWithObjects:@"4",@"5",@"6", nil]autorelease];
    return arr;
}

-(NSMutableArray *)getArray2
{
    NSLog(@"Arr2_retain = %d",[_testArr retainCount]);
    //如果切换指针指向，下面一句基本没有作用
    [self.testArr removeAllObjects];
    //自动管理内存，出了这个函数，arr基本就释放了
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"q",@"w",@"e", nil];
    return arr;
}

-(NSMutableArray *)getArray3
{
    NSLog(@"Arr3_retain = %d",[_testArr retainCount]);
    //[self.testArr removeAllObjects];
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"a",@"v",@"c", nil];
    return arr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hello:(id)sender {
    self.testArr = [self getArray2];
    NSLog(@"%@",_testArr);
    NSLog(@"NewArr1_retain = %d",[_testArr retainCount]);
}

- (IBAction)helloarr:(id)sender {
    [_testArr addObjectsFromArray:[self getArray3]];
    //_testArr = [self getArray3];
    NSLog(@"%@",_testArr);
    NSLog(@"NewArr2_retain = %d",[_testArr retainCount]);
}
@end
