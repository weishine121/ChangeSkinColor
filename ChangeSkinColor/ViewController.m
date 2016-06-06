//
//  ViewController.m
//  ChangeSkinColor
//
//  Created by weishine on 16/6/6.
//  Copyright © 2016年 weishine. All rights reserved.
//

#import "ViewController.h"
#import "DLSkinTool.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *firstView;
@property (weak, nonatomic) IBOutlet UIImageView *secondView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeSkinColor];

}


- (IBAction)click1:(id)sender {
    [DLSkinTool setSkinColor:@"blue"];
//    [DLSkinTool skinToolWithImageName:@"face"];
    [self changeSkinColor];
    
    
}
- (IBAction)click2:(id)sender {
    [DLSkinTool setSkinColor:@"green"];
    [self changeSkinColor];
}
- (IBAction)click3:(id)sender {
    
    [DLSkinTool setSkinColor:@"orange"];
    [self changeSkinColor];
    
}

- (void)changeSkinColor
{
    // 1.拼接图片名称,设置对应皮肤的图片
    self.firstView.image = [DLSkinTool skinToolWithImageName:@"face"];
    self.secondView.image = [DLSkinTool skinToolWithImageName:@"heart"];
    self.thirdView.image = [DLSkinTool skinToolWithImageName:@"rect"];
    
    // 2.设置背景颜色
    self.testLabel.backgroundColor = [DLSkinTool bgColor];
    self.testButton.backgroundColor = [DLSkinTool bgColor];
}




@end
