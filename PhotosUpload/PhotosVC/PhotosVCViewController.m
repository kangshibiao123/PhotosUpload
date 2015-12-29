//
//  PhotosVCViewController.m
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

@import Photos;

#import "PhotosVCViewController.h"

@interface PhotosVCViewController ()

@end

@implementation PhotosVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imagesArr =[NSMutableArray array];

    [self gitImages];
    [self reign];
    
    
}
- (NSMutableArray *)btnArr{
    
    if (!_btnArr) {
        
        _btnArr =[NSMutableArray array];
        
    }
    return _btnArr;
}
- (void)gitImages{
    
    // 列出所有相册智能相册
//    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
//    
//    // 列出所有用户创建的相册
//    PHFetchResult *topLevelUserCollections = [PHCollectionList fetchTopLevelUserCollectionsWithOptions:nil];
    
    // 获取所有资源的集合，并按资源的创建时间排序
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    
    PHFetchResult *assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    
    
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) {
        NSLog(@"用户拒绝当前应用访问相册,我们需要提醒用户打开访问开关");
    }else if (status == PHAuthorizationStatusRestricted){
        NSLog(@"家长控制,不允许访问");
    }else if (status == PHAuthorizationStatusNotDetermined){
        NSLog(@"用户还没有做出选择");

    }else if (status == PHAuthorizationStatusAuthorized){
        NSLog(@"用户允许当前应用访问相册");
//        [self saveImage];
    }

    // 在资源的集合中获取第一个集合，并获取其中的图片
    PHCachingImageManager *imageManager = [[PHCachingImageManager alloc] init];
  
    NSLog(@"---%d",assetsFetchResults.count);
    
    
    for (int i = 0; i <assetsFetchResults.count; i ++)
    {
          PHAsset *asset = assetsFetchResults[i];
        [imageManager requestImageForAsset:asset
                                targetSize:CGSizeMake(96, 96)
                               contentMode:PHImageContentModeAspectFill
                                   options:nil
                             resultHandler:^(UIImage *result, NSDictionary *info)
         {
             
             NSLog(@"---%@",result);
             
             [self.imagesArr addObject:result];
             
             // 得到一张 UIImage，展示到界面上
             if (self.imagesArr.count == 10) {
                 
                 [self.collertionView reloadData];
                 
              
                 return ;
             }
             
             
         }];
    }
   
    
}

- (void)reign{
    
    [self.collertionView registerNib:[UINib nibWithNibName:@"ItemsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ksCell"];
    
    self.collertionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.imagesArr.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ItemsCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ksCell" forIndexPath:indexPath];
    __weak typeof(self) weakSelf =self;
    
    cell.block1 = ^(UIButton *button){
        
        
        [weakSelf setBtnImage:button];
        
        
    };
    
    [cell images:indexPath imagesArr:self.imagesArr btnArr:self.btnArr];
    return cell;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
#pragma mark -- UICollectionViewDelegate

#pragma mark -- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    int width = [UIScreen mainScreen].bounds.size.width;
    
//    int ad = arc4random()%100;
    
    
    return  CGSizeMake(width*0.23409, width*0.23409);
    
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 0,0);//分别为上、左、下、右
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return  5;
}
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
//    //返回每个 item 的高度
//    
//    return (arc4random() % 70) + 200;
//}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ToViewPhotoViewController * top  =[[ToViewPhotoViewController alloc]init];
    top.imagesArr = self.imagesArr;
    
    [self.navigationController pushViewController:top animated:YES];
    
    ItemsCollectionViewCell * cell = (ItemsCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    NSLog(@"---%@",cell.icoImage.image);
    
}
- (void)setBtnImage:(UIButton *)button{
    
    __weak typeof(self)  weakSelf =self;
    
    
    for (NSNumber * number in weakSelf.btnArr) {
        
        if ([number integerValue] == button.tag) {
            
            [button setImage:[UIImage imageNamed:@"ks_1@2x"] forState:UIControlStateNormal];
            
            [weakSelf.btnArr removeObject:@(button.tag)];
            
            return ;
        }
    }
    
    [button setImage:[UIImage imageNamed:@"ks_2@2x"] forState:UIControlStateNormal];
    
    [weakSelf.btnArr addObject:@(button.tag)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
