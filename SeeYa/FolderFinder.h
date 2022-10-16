@interface FolderFinder : NSObject
  +(NSString*) findSharedFolder:(NSString*) appName;
  +(NSString*) findFolder:(NSString*) appName folder:(NSString*) dir;
@end
