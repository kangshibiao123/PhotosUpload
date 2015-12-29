//
//  ItemsCollectionViewCell.h
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)(UIButton *button);

@interface ItemsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton * icoBtn;
@property (weak, nonatomic) IBOutlet UIImageView * icoImage;

@property (copy,nonatomic) myBlock block1;


- (void)images:(NSIndexPath *)indexPath imagesArr:(NSMutableArray *)imagesArr btnArr:(NSMutableArray *)btnArr;

@end
