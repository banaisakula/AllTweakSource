#line 1 "/Users/lovez/Desktop/AA/AA/WallpaperLoader/Tweak.x"


#include "Tweak.h"

static NSMutableArray *stillList;
static NSMutableArray *liveList;



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WKWallpaperBundleCollection; @class WKWallpaperBundle; @class WKStillWallpaper; @class WKLiveWallpaper; 
static long long (*_logos_orig$_ungrouped$WKWallpaperBundleCollection$numberOfItems)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST, SEL); static long long _logos_method$_ungrouped$WKWallpaperBundleCollection$numberOfItems(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST, SEL, unsigned long long); static id _logos_method$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST, SEL, unsigned long long); static NSString * (*_logos_orig$_ungrouped$WKWallpaperBundle$name)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$WKWallpaperBundle$name(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$WKWallpaperBundle$family)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$WKWallpaperBundle$family(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_orig$_ungrouped$WKWallpaperBundle$version)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$WKWallpaperBundle$version(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static unsigned long long (*_logos_orig$_ungrouped$WKWallpaperBundle$identifier)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static unsigned long long _logos_method$_ungrouped$WKWallpaperBundle$identifier(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$WKWallpaperBundle$isAppearanceAware)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$WKWallpaperBundle$isAppearanceAware(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSURL * (*_logos_orig$_ungrouped$WKWallpaperBundle$thumbnailImageURL)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSURL * _logos_method$_ungrouped$WKWallpaperBundle$thumbnailImageURL(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSMutableDictionary * (*_logos_orig$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static NSMutableDictionary * _logos_method$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$)(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$WKStillWallpaper$thumbnailImage(_LOGOS_SELF_TYPE_NORMAL WKStillWallpaper* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WKStillWallpaper$wallpaperValue(_LOGOS_SELF_TYPE_NORMAL WKStillWallpaper* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WKLiveWallpaper$thumbnailImage(_LOGOS_SELF_TYPE_NORMAL WKLiveWallpaper* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$WKLiveWallpaper$wallpaperValue(_LOGOS_SELF_TYPE_NORMAL WKLiveWallpaper* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WKWallpaperBundle(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WKWallpaperBundle"); } return _klass; }
#line 9 "/Users/lovez/Desktop/AA/AA/WallpaperLoader/Tweak.x"

static long long _logos_method$_ungrouped$WKWallpaperBundleCollection$numberOfItems(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if (self.wallpaperType == 0) {
    return _logos_orig$_ungrouped$WKWallpaperBundleCollection$numberOfItems(self, _cmd) + [stillList count];
  } else if (self.wallpaperType == 1) {
    return _logos_orig$_ungrouped$WKWallpaperBundleCollection$numberOfItems(self, _cmd) + [liveList count];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundleCollection$numberOfItems(self, _cmd);
}

static id _logos_method$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundleCollection* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long index) {
  if (self.wallpaperType == 0) {
    for (int i = 1; i <= [stillList count]; i++) {
      if (index == [self numberOfItems] - [stillList count] + i - 1) {
        WKWallpaperBundle *bundle = [[_logos_static_class_lookup$WKWallpaperBundle() alloc] init];
        bundle.wallpaperType = @(self.wallpaperType);
        bundle.loadTag = @(i);
        return bundle;
      }
    }
  } else if (self.wallpaperType == 1) {
    for (int i = 1; i <= [liveList count]; i++) {
      if (index == [self numberOfItems] - [liveList count] + i - 1) {
        WKWallpaperBundle *bundle = [[_logos_static_class_lookup$WKWallpaperBundle() alloc] init];
        bundle.wallpaperType = @(self.wallpaperType);
        bundle.loadTag = @(i);
        return bundle;
      }
    }
  }
  return _logos_orig$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$(self, _cmd, index);
}




__attribute__((used)) static NSNumber * _logos_property$_ungrouped$WKWallpaperBundle$wallpaperType(WKWallpaperBundle * __unused self, SEL __unused _cmd) { return (NSNumber *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$WKWallpaperBundle$wallpaperType); }; __attribute__((used)) static void _logos_property$_ungrouped$WKWallpaperBundle$setWallpaperType(WKWallpaperBundle * __unused self, SEL __unused _cmd, NSNumber * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$WKWallpaperBundle$wallpaperType, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSNumber * _logos_property$_ungrouped$WKWallpaperBundle$loadTag(WKWallpaperBundle * __unused self, SEL __unused _cmd) { return (NSNumber *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$WKWallpaperBundle$loadTag); }; __attribute__((used)) static void _logos_property$_ungrouped$WKWallpaperBundle$setLoadTag(WKWallpaperBundle * __unused self, SEL __unused _cmd, NSNumber * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$WKWallpaperBundle$loadTag, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static NSString * _logos_method$_ungrouped$WKWallpaperBundle$name(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@0]) {
    return stillList[[self.loadTag intValue] - 1][@"name"];
  } else if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@1]) {
    return liveList[[self.loadTag intValue] - 1][@"name"];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$name(self, _cmd);
}

static NSString * _logos_method$_ungrouped$WKWallpaperBundle$family(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0) {
    return @"WallpaperLoader";
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$family(self, _cmd);
}

static unsigned long long _logos_method$_ungrouped$WKWallpaperBundle$version(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0) {
    return 1;
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$version(self, _cmd);
}

static unsigned long long _logos_method$_ungrouped$WKWallpaperBundle$identifier(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0) {
    return 1;
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$identifier(self, _cmd);
}

static BOOL _logos_method$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0) {
    return NO;
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations(self, _cmd);
}

static BOOL _logos_method$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0) {
    return NO;
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle(self, _cmd);
}

static BOOL _logos_method$_ungrouped$WKWallpaperBundle$isAppearanceAware(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@0]) {
    return stillList[[self.loadTag intValue] - 1][@"appearanceAware"];
  } else if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@1]) {
    return liveList[[self.loadTag intValue] - 1][@"appearanceAware"];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$isAppearanceAware(self, _cmd);
}

static NSURL * _logos_method$_ungrouped$WKWallpaperBundle$thumbnailImageURL(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@0]) {
    return [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/WallpaperLoader/%@/%@", stillList[[self.loadTag intValue] - 1][@"name"], stillList[[self.loadTag intValue] - 1][@"thumbnailImage"]]];
  } else if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@1]) {
    return [NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/WallpaperLoader/%@/%@", liveList[[self.loadTag intValue] - 1][@"name"], liveList[[self.loadTag intValue] - 1][@"thumbnailImage"]]];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$thumbnailImageURL(self, _cmd);
}

static NSMutableDictionary * _logos_method$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@0]) {
    NSString *name = stillList[[self.loadTag intValue] - 1][@"name"];
    NSString *path = [NSString stringWithFormat:@"/Library/WallpaperLoader/%@", name];

    WKStillWallpaper *wp = [[NSClassFromString(@"WKStillWallpaper") alloc] initWithIdentifier:1234 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"defaultImage"]]]];

    return [@{@"WKWallpaperLocationCoverSheet": wp} mutableCopy];
  } else if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@1]) {
    NSString *name = liveList[[self.loadTag intValue] - 1][@"name"];
    NSString *path = [NSString stringWithFormat:@"/Library/WallpaperLoader/%@", name];

    WKLiveWallpaper *wp = [[NSClassFromString(@"WKLiveWallpaper") alloc] initWithIdentifier:1234 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"defaultImage"]]] videoAssetURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"defaultVideo"]]] stillTimeInVideo:0];

    return [@{@"WKWallpaperLocationCoverSheet": wp} mutableCopy];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers(self, _cmd);
}

static id _logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id location, id appearance) {
  if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@0]) {
    NSString *name = stillList[[self.loadTag intValue] - 1][@"name"];
    NSString *path = [NSString stringWithFormat:@"/Library/WallpaperLoader/%@", name];
    if ([appearance isEqualToString:@"default"]) {
      WKStillWallpaper *wp = [[NSClassFromString(@"WKStillWallpaper") alloc] initWithIdentifier:1233 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"defaultImage"]]]];
      return wp;
    } else if ([appearance isEqualToString:@"dark"]) {
      WKStillWallpaper *wp = [[NSClassFromString(@"WKStillWallpaper") alloc] initWithIdentifier:1234 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, stillList[[self.loadTag intValue] - 1][@"darkImage"]]]];
      return wp;
    }
  } else if ([self.loadTag intValue] > 0 && [self.wallpaperType isEqual:@1]) {
    NSString *name = liveList[[self.loadTag intValue] - 1][@"name"];
    NSString *path = [NSString stringWithFormat:@"/Library/WallpaperLoader/%@", name];
    if ([appearance isEqualToString:@"default"]) {
      WKLiveWallpaper *wp = [[NSClassFromString(@"WKLiveWallpaper") alloc] initWithIdentifier:1234 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"defaultImage"]]] videoAssetURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"defaultVideo"]]] stillTimeInVideo:0];
      return wp;
    } else if ([appearance isEqualToString:@"dark"]) {
      WKLiveWallpaper *wp = [[NSClassFromString(@"WKLiveWallpaper") alloc] initWithIdentifier:1234 name:name thumbnailImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"thumbnailImage"]]] fullsizeImageURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"darkImage"]]] videoAssetURL:[NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", path, liveList[[self.loadTag intValue] - 1][@"darkVideo"]]] stillTimeInVideo:0];
      return wp;
    }
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$(self, _cmd, location, appearance);
}

static id _logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id location) {
  if ([self.loadTag intValue] > 0) {
    return [self valueBasedWallpaperForLocation:location andAppearance:@"default"];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$(self, _cmd, location);
}

static id _logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id location) {
  if ([self.loadTag intValue] > 0) {
    return [self fileBasedWallpaperForLocation:location andAppearance:@"default"];
  }
  return _logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$(self, _cmd, location);
}

static id _logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$(_LOGOS_SELF_TYPE_NORMAL WKWallpaperBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id location, id appearance) {
  if ([self.loadTag intValue] > 0)
    return [self fileBasedWallpaperForLocation:location andAppearance:appearance];
  return _logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$(self, _cmd, location, appearance);
}





static id _logos_method$_ungrouped$WKStillWallpaper$thumbnailImage(_LOGOS_SELF_TYPE_NORMAL WKStillWallpaper* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return [[UIImage alloc] init];
}

static id _logos_method$_ungrouped$WKStillWallpaper$wallpaperValue(_LOGOS_SELF_TYPE_NORMAL WKStillWallpaper* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return nil;
}




static id _logos_method$_ungrouped$WKLiveWallpaper$thumbnailImage(_LOGOS_SELF_TYPE_NORMAL WKLiveWallpaper* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return [[UIImage alloc] init];
}

static id _logos_method$_ungrouped$WKLiveWallpaper$wallpaperValue(_LOGOS_SELF_TYPE_NORMAL WKLiveWallpaper* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return nil;
}


static __attribute__((constructor)) void _logosLocalCtor_863a598c(int __unused argc, char __unused **argv, char __unused **envp) {
  NSArray *subpaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:@"/Library/WallpaperLoader" error:NULL];
  for (NSString *item in subpaths) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/Library/WallpaperLoader/%@/Wallpaper.plist", item]]) {
      NSMutableDictionary *plist = [[NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/Library/WallpaperLoader/%@/Wallpaper.plist", item]] mutableCopy];

      
      if (!plist[@"defaultImage"] || (plist[@"appearanceAware"] && !plist[@"darkImage"])) {
        NSLog(@"[WallpaperLoader] nope :( %@", plist[@"wallpaperType"]);
      } else {
        plist[@"name"] = item;
        if (!plist[@"thumbnailImage"]) plist[@"thumbnailImage"] = plist[@"defaultImage"];
        if ([plist[@"wallpaperType"] isEqual:@0]) {
          if (!stillList) stillList = [[NSMutableArray alloc] init];
          [stillList addObject:[plist copy]];
        } else if ([plist[@"wallpaperType"] isEqual:@1]) {
          if (!liveList) liveList = [[NSMutableArray alloc] init];
          [liveList addObject:[plist copy]];
        }
      }
    }
  }

  {Class _logos_class$_ungrouped$WKWallpaperBundleCollection = objc_getClass("WKWallpaperBundleCollection"); { MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundleCollection, @selector(numberOfItems), (IMP)&_logos_method$_ungrouped$WKWallpaperBundleCollection$numberOfItems, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundleCollection$numberOfItems);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundleCollection, @selector(wallpaperBundleAtIndex:), (IMP)&_logos_method$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundleCollection$wallpaperBundleAtIndex$);}Class _logos_class$_ungrouped$WKWallpaperBundle = objc_getClass("WKWallpaperBundle"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"NSNumber\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$WKWallpaperBundle, "wallpaperType", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSNumber *)); class_addMethod(_logos_class$_ungrouped$WKWallpaperBundle, @selector(wallpaperType), (IMP)&_logos_property$_ungrouped$WKWallpaperBundle$wallpaperType, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSNumber *)); class_addMethod(_logos_class$_ungrouped$WKWallpaperBundle, @selector(setWallpaperType:), (IMP)&_logos_property$_ungrouped$WKWallpaperBundle$setWallpaperType, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"NSNumber\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$WKWallpaperBundle, "loadTag", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSNumber *)); class_addMethod(_logos_class$_ungrouped$WKWallpaperBundle, @selector(loadTag), (IMP)&_logos_property$_ungrouped$WKWallpaperBundle$loadTag, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSNumber *)); class_addMethod(_logos_class$_ungrouped$WKWallpaperBundle, @selector(setLoadTag:), (IMP)&_logos_property$_ungrouped$WKWallpaperBundle$setLoadTag, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(name), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$name, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$name);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(family), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$family, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$family);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(version), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$version, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$version);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(identifier), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$identifier, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$identifier);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(hasDistintWallpapersForLocations), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$hasDistintWallpapersForLocations);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(isDynamicWallpaperBundle), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$isDynamicWallpaperBundle);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(isAppearanceAware), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$isAppearanceAware, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$isAppearanceAware);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(thumbnailImageURL), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$thumbnailImageURL, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$thumbnailImageURL);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(_defaultAppearanceWallpapers), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$_defaultAppearanceWallpapers);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(fileBasedWallpaperForLocation:andAppearance:), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$andAppearance$);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(valueBasedWallpaperForLocation:), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(fileBasedWallpaperForLocation:), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$fileBasedWallpaperForLocation$);}{ MSHookMessageEx(_logos_class$_ungrouped$WKWallpaperBundle, @selector(valueBasedWallpaperForLocation:andAppearance:), (IMP)&_logos_method$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$, (IMP*)&_logos_orig$_ungrouped$WKWallpaperBundle$valueBasedWallpaperForLocation$andAppearance$);}Class _logos_class$_ungrouped$WKStillWallpaper = objc_getClass("WKStillWallpaper"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WKStillWallpaper, @selector(thumbnailImage), (IMP)&_logos_method$_ungrouped$WKStillWallpaper$thumbnailImage, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WKStillWallpaper, @selector(wallpaperValue), (IMP)&_logos_method$_ungrouped$WKStillWallpaper$wallpaperValue, _typeEncoding); }Class _logos_class$_ungrouped$WKLiveWallpaper = objc_getClass("WKLiveWallpaper"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WKLiveWallpaper, @selector(thumbnailImage), (IMP)&_logos_method$_ungrouped$WKLiveWallpaper$thumbnailImage, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WKLiveWallpaper, @selector(wallpaperValue), (IMP)&_logos_method$_ungrouped$WKLiveWallpaper$wallpaperValue, _typeEncoding); }}
}
