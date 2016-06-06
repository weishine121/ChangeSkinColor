//
//  secondViewController.m
//  ChangeSkinColor
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "secondViewController.h"
#import "DLSkinTool.h"

@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *firstView;

@property (weak, nonatomic) IBOutlet UIImageView *secondView;

@property (weak, nonatomic) IBOutlet UIView *testView;
@end
@implementation secondViewController

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.firstView.image = [DLSkinTool skinToolWithImageName:@"face"];
    self.secondView.image = [DLSkinTool skinToolWithImageName:@"heart"];
    self.testView.backgroundColor = [DLSkinTool bgColor];
}
@end
