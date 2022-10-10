@interface PUOneUpViewController : UIViewController
-(id)pu_debugCurrentAsset;
@end

@interface PUNavigationController
-(UIViewController *)_currentToolbarViewController;
@end

@interface PHAsset : NSObject
-(CGSize)imageSize;
-(id)mainFileURL;
@end

@interface PUPhotoBrowserTitleViewController : UIViewController
-(void)_setNeedsUpdate;
@end

%hook PUPhotoBrowserTitleViewController
-(void)_setTimeDescription:(id)arg1 {
    PHAsset *asset = [(PUOneUpViewController *)[(PUNavigationController *)[[self view] performSelector:@selector(_viewControllerForAncestor)] _currentToolbarViewController] pu_debugCurrentAsset];
    if (asset) {
        CGSize imageSize = [asset imageSize];
        NSString *correctURL = [[[asset mainFileURL] absoluteString] stringByReplacingOccurrencesOfString:@"file://" withString:@""];
        NSDictionary *fileAttributes;
        NSNumber *fileSizeNumber;
        long long fileSize;
        float fileSizeMB;
        BOOL isDirectory;
        if ([[NSFileManager defaultManager] fileExistsAtPath:correctURL isDirectory:&isDirectory]) {
            fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:correctURL error:nil];
            fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
            fileSize = [fileSizeNumber longLongValue];
            fileSizeMB = (float)fileSize / (1024 * 1024);
        } else {
            fileSizeMB = 0;
        }

        NSString *newTitle = [NSString stringWithFormat:@"%@ (%ix%i, %.02fMB)", arg1, (int)imageSize.width, (int)imageSize.height, fileSizeMB];
        %orig(newTitle);
    }
    else
        %orig;
}
%end
