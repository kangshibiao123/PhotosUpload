//
//  PhotosVCViewController.h
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ItemsCollectionViewCell.h"
#import "ToViewPhotoViewController.h"
@interface PhotosVCViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collertionView;
@property (strong, nonatomic) NSMutableArray * imagesArr;

@property (strong, nonatomic) NSMutableArray * btnArr;



@end
