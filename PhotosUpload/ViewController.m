//
//  ViewController.m
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import "ViewController.h"
#import "PhotosVCViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    PhotosVCViewController * ph = [[PhotosVCViewController alloc]init];
    
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:ph];
    
    UIWindow * win = [[UIApplication sharedApplication].delegate window];
    
    win.rootViewController =nav;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
