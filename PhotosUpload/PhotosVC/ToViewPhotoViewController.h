//
//  ToViewPhotoViewController.h
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMScrollView.h"
@interface ToViewPhotoViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) SMScrollView *myScrollView;

@property (weak,nonatomic) IBOutlet UIScrollView * scrollView;

@property (strong, nonatomic) NSMutableArray * imagesArr;


@end
