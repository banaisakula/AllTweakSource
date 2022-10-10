#import <Foundation/Foundation.h>

NSString *const NSFaceIDUsageDescriptionKey = @"NSFaceIDUsageDescription";
NSString *const FaceIDUsageDescription = @"Anne would like to see your face";

int main(int argc, char *argv[], char *envp[]) {
    // This is kinda bad but ya know, whatever
    NSURL *plistURL = [NSURL URLWithString:@"file:///Applications/MobileSlideShow.app/Info.plist"];
    NSMutableDictionary *dict = [[NSDictionary dictionaryWithContentsOfURL:plistURL
                                                                     error:nil] mutableCopy];
    if(dict[NSFaceIDUsageDescriptionKey] == nil) {
        [dict setObject:FaceIDUsageDescription forKey:NSFaceIDUsageDescriptionKey];
        [dict writeToURL:plistURL error:nil];
        printf("Anne: Fixed FaceID Usage description\n");
    } else {
        printf("Anne: FaceID Usage description already present, skipping\n");
    }
    return 0;
}
