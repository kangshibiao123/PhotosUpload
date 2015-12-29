//
//  ItemsCollectionViewCell.m
//  PhotosUpload
//
//  Created by mc on 15/12/25.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import "ItemsCollectionViewCell.h"

@implementation ItemsCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    

    
}

- (IBAction)icoBtn:(UIButton *)sender{
    
    if (self.block1) {
        
        self.block1(sender);
        
    }
}
- (void)images:(NSIndexPath *)indexPath imagesArr:(NSMutableArray *)imagesArr btnArr:(NSMutableArray *)btnArr
{
    self.icoImage.image = imagesArr[indexPath.row];
    
    self.icoBtn.tag = indexPath.item;

    [self.icoBtn setImage:[UIImage imageNamed:@"ks_1@2x"] forState:UIControlStateNormal];
    
    for (NSNumber * number in btnArr)
    {
        
        if (indexPath.item == [number integerValue])
        {
             [self.icoBtn setImage:[UIImage imageNamed:@"ks_2@2x"] forState:UIControlStateNormal];
        }

    }
    


    
}
@end
