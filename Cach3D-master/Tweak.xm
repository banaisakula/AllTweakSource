#import <Foundation/Foundation.h>

NSString *plistName = @".com.apple.mobile_container_manager.metadata.plist";
NSString *plistPath;
NSString *appBundle;
NSString *p;

@interface SBIconView : NSObject
- (NSString*)applicationBundleIdentifier;
- (NSString*)applicationBundleIdentifierForShortcuts;
@end


@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic,copy) NSString* type;
@property (nonatomic,copy) NSString* localizedTitle;
@property (nonatomic,copy) NSString* localizedSubtitle;
@property (nonatomic,copy) NSDictionary* userInfo;
@property (assign,nonatomic) NSUInteger activationMode;
@property (nonatomic,copy) NSString* bundleIdentifierToLaunch;
@end

@interface SBUIAppIconForceTouchControllerDataProvider : NSObject
- (NSString*)applicationBundleIdentifier;
@end

%hook SBIconView
-(NSArray *)applicationShortcutItems {
  NSArray *orig = %orig;
  NSString *bundleID;

  if([self respondsToSelector:@selector(applicationBundleIdentifier)]){
    bundleID = [self applicationBundleIdentifier];
  } else if ([self respondsToSelector:@selector(applicationBundleIdentifierForShortcuts)]){
    bundleID = [self applicationBundleIdentifierForShortcuts];
  }
  if(!bundleID){
    return orig;
  }
  SBSApplicationShortcutItem* clearCache = [[%c(SBSApplicationShortcutItem) alloc] init];
  clearCache.localizedTitle = [NSString stringWithFormat:@"Clear Cache"];
  clearCache.type = @"com.donato.clearCache.item";
  return [orig arrayByAddingObject:clearCache];
  return orig;
}

+(void) activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(NSString*)bundleID forIconView:(id)iconView {
  if([[item type] isEqualToString:@"com.donato.clearCache.item"]) {
    NSString *path = @"/var/mobile/Containers/Data/Application";
    NSArray* dirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:Nil];
    for(int i = 0; i < dirs.count; i++)
    {
      // dirs[i] represents one app UUID
      NSString *newPath = [NSString stringWithFormat:@"%@/%@", path, (NSString*)dirs[i]];
      NSArray* newPathDirs = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:newPath error:Nil];
      for(int j = 0; j < newPathDirs.count; j++)
      {
        if([newPathDirs[j] isEqual:@".com.apple.mobile_container_manager.metadata.plist"])
        {
          plistPath = [NSString stringWithFormat:@"%@/%@/%@", path, (NSString*)dirs[i], (NSString*)newPathDirs[j]];
          NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile: plistPath];
          id obj = [dict objectForKey: @"MCMMetadataIdentifier"];
          appBundle = (NSString *)obj;
          if([appBundle isEqual:bundleID]) p = newPath;
        }
      }
    }
    NSString *directory = [NSString stringWithFormat:@"%@/Library/Caches", p];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSArray *fileArray = [fileMgr contentsOfDirectoryAtPath:directory error:nil];
    for (NSString *filename in fileArray)  {
       [fileMgr removeItemAtPath:[directory stringByAppendingPathComponent:filename] error:NULL];
    }
  } else {
    %orig;
  }
}
%end
