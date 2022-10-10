#include "fishhook.h"

// 通过logos语法中%hookf替换成自己写的fopen函数
FILE *fopen(const char *path, const char *mode);
%hookf(FILE *, fopen, const char *path, const char *mode) {
	
	NSString *pathString = [NSString stringWithUTF8String:path];
	
	if ([pathString isEqualToString:@"/bin/ssh"]) {
		// 当新写的fopen函数检测到ssh后，则返回”未找到SSH命令“
		return NULL;
	}
	return %orig;

}

// 经过测试Hook C函数使用fishhook编译不会出现'strstr' does not match required type 'void'错误
// 使用FaceBook开源fishhook替换C函数strstr，写自己的strstr函数
static char* (*orig_strstr)(const char *__big, const char *__little);
char *my_strstr(const char *__big, const char *__little) {
	
	NSString *littleString = [NSString stringWithUTF8String:__little];	

	if ([littleString isEqualToString:@"MobileSubstrate"] || [littleString isEqualToString:@"Substrate"]) {
		// 当发现MobileSubstrate、Substrate，则返回未发现
		return NULL;
	}
	return orig_strstr(__big, __little);
}

%ctor {
	NSLog(@"----snail hook alipay-----");
	// fishhook替换strstr函数，替换成自己的写的my_strstr
	rebind_symbols((struct rebinding[1]){{"strstr", (void *)my_strstr, (void **)&orig_strstr}}, 1);
}