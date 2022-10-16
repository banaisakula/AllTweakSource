#include <unistd.h>
#include <dlfcn.h>
#include <stdio.h>
#include <sysexits.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <limits.h>
#include <string.h>

#define mssPath @"/Applications/MobileSlideShow.app/Info.plist"

int main(int argc, char *argv[], char *envp[]) {
	if (getuid() !=0) {
    	setuid(0);
		setgid(0);
		NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:mssPath];
   	    [dictionary setObject:@"Use Face ID to view and manage hidden album." forKey:@"NSFaceIDUsageDescription"];
    	[dictionary writeToFile:mssPath atomically:YES];
	}
	if (getuid() != 0) {
    	printf("The lighter broke, please refill gas!");
    	return 0;
	}
}

