#import <stdio.h>
#import <string.h>
#import <dlfcn.h>
#import <objc/runtime.h>

void performSelectorWithInteger(id parent, SEL selector, NSInteger integer) {
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[parent methodSignatureForSelector:selector]];
    [inv setTarget:parent];
    [inv setSelector:selector];
    [inv setArgument:&integer atIndex:2];
    [inv invoke];
}

//int location: this variable determines which locations to set a wallpaper for. pass 1 for only the lock screen, 2 for only the home screen, or 3 for both
void setWallpaper(NSString *pathToLightImage, NSString *pathToDarkImage, int location, bool parallax) {
    UIImage *lightImage = [UIImage imageWithContentsOfFile:pathToLightImage];
    UIImage *darkImage = [UIImage imageWithContentsOfFile:pathToDarkImage];
    
    dlopen("/System/Library/PrivateFrameworks/SpringBoardFoundation.framework/SpringBoardFoundation", RTLD_LAZY); //load the necessary private frameworks
    void *SBUIServs = dlopen("/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/SpringBoardUIServices", RTLD_LAZY);
    
    id lightOptions = [[objc_getClass("SBFWallpaperOptions") alloc] init]; //this is a NSDictionary that contains settings for wallpaper behavior
    id darkOptions = [[objc_getClass("SBFWallpaperOptions") alloc] init];
    
    if (!parallax) {
        performSelectorWithInteger(lightOptions, @selector(setParallaxFactor:), 0); //parallax is off when parallaxFactor is zero (parallax is Perspective Zoom)
        performSelectorWithInteger(darkOptions, @selector(setParallaxFactor:), 0);
    }
    
    if (@available(iOS 13, *)) {
        int (*SBSUIWallpaperSetImages)(NSDictionary *imagesDict, NSDictionary *optionsDict, int location, int interfaceStyle) = dlsym(SBUIServs, "SBSUIWallpaperSetImages"); //get a pointer to the necessary function
        
        performSelectorWithInteger(lightOptions, @selector(setWallpaperMode:), 1); //pass 1 to set options for the light mode wallpaper. this only needs to be done when setting an appearance-aware wallpaper
        performSelectorWithInteger(darkOptions, @selector(setWallpaperMode:), 2); //pass 2 for the dark mode wallpaper
        SBSUIWallpaperSetImages(@{@"light":lightImage, @"dark":darkImage}, @{@"light":lightOptions, @"dark":darkOptions}, location, UIUserInterfaceStyleDark); //this is what actually sets the wallpaper
    }
    else {
        void (*SBSUIWallpaperSetImage)(UIImage *image, NSDictionary *optionsDict, NSInteger location) = dlsym(SBUIServs, "SBSUIWallpaperSetImage");
        SBSUIWallpaperSetImage(lightImage, lightOptions, location);
    }
}

void displayUsage() {
    printf("Usage: wallpaper [mode] [path to image(s)] [location to set] [parallax on/off]\n");
    printf("       -n\tSet a normal wallpaper. Specify the image path immediately after -n\n");
    printf("       -a\tSet an appearance-aware wallpaper. Specify the light image path immediately after -a and the dark image path after that\n");
    printf("       Choose between -n and -a. Do not specify more than one\n");
    printf("\n");
    printf("       -l\tSet only the lock screen wallpaper\n");
    printf("       -h\tSet only the home screen wallpaper\n");
    printf("       -b\tSet both wallpapers\n");
    printf("       Choose between -h, -l, and -b. Do not specify more than one\n");
    printf("\n");
    printf("       -p\tEnable parallax (optional parameter - parallax is off by default)\n");
    printf("       --help\tShow this help page\n");
    printf("\n");
    printf("       All arguments are required except -p\n");
    printf("       When using -n, be sure to specify only one path. When using -a, be sure to specify two paths\n");
    printf("       Appearance-aware wallpapers can only be used on iOS 13+\n");
}

bool imageIsValid(NSString *path) {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path] || [UIImage imageWithContentsOfFile:path] == nil) {
        printf("Error: specified file(s) does not exist or is not a usable image\n");
        return false;
    }
    return true;
}

int main(int argc, char *argv[], char *envp[]) {
    if (argc == 1 || !strcmp(argv[1], "--help")) {
        displayUsage();
        return 1;
    }
    
    NSString *pathToLightImage;
    NSString *pathToDarkImage;
    int location;
    bool parallax = false;
    
    for (int i = 1; i < argc; i++) { //parse the arguments
        if (!strcmp(argv[i], "-n")) {
            pathToLightImage = [[NSString alloc] initWithCString:argv[i + 1] encoding:NSUTF8StringEncoding];
            pathToDarkImage = pathToLightImage;
            
            if (!imageIsValid(pathToLightImage)) {
                return 1;
            }
        }
        else if (!strcmp(argv[i], "-a")) {
            pathToLightImage = [[NSString alloc] initWithCString:argv[i + 1] encoding:NSUTF8StringEncoding];
            pathToDarkImage = [[NSString alloc] initWithCString:argv[i + 2] encoding:NSUTF8StringEncoding];
            
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 13.0) {
                printf("Error: appearance-aware wallpapers do not exist on iOS 12 and older\n");
                return 1;
            }
            else if (!imageIsValid(pathToLightImage) || !imageIsValid(pathToDarkImage)) {
                return 1;
            }
        }
        else if (!strcmp(argv[i], "-l")) {
            location = 1;
        }
        else if (!strcmp(argv[i], "-h")) {
            location = 2;
        }
        else if (!strcmp(argv[i], "-b")) {
            location = 3;
        }
        else if (!strcmp(argv[i], "-p")) {
            parallax = true;
        }
    }

    setWallpaper(pathToLightImage, pathToDarkImage, location, parallax);
    return 0;
}
