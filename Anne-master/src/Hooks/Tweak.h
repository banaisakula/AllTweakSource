//
// Created by ren7995 on 2022-03-21 13:37:49
// Copyright (c) 2021 ren7995. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PXNavigationListGadget : UIViewController <UITableViewDelegate>
@end

@interface PHAssetCollection : NSObject
- (BOOL)px_isHiddenSmartAlbum;
@end

@interface PXNavigationListAssetCollectionItem : NSObject
- (PHAssetCollection *)collection;
@end

@interface PXNavigationListCell : UITableViewCell
- (PXNavigationListAssetCollectionItem *)listItem;
@end