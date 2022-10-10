#include <Cephei/HBPreferences.h>

@interface DCDChatInput : UITextView
@property(nonatomic, copy, readwrite) NSString *text;
@end

HBPreferences *preferences;
static BOOL enabled = NO;
static NSString *suffix = @"";

%hook DCDChatInput
-(void)textInputDidChange:(id)arg1 {
	NSString *text = [NSString stringWithFormat:@" %@", suffix];
	%orig;
	if(enabled) {
		if(![self.text hasSuffix:text]) {
			[self setText:[self.text stringByAppendingString:text]];
		}
		if(self.selectedRange.location > [self.text length] - [text length] ) {
			[self setSelectedRange:NSMakeRange([self.text length] - [text length], 0)];
		}
	}
}
-(void)endSelectionChange {
	NSString *text = [NSString stringWithFormat:@" %@", suffix];
	if(enabled) {
		if(self.selectedRange.location > [self.text length] - [text length] ) {
			[self setSelectedRange:NSMakeRange([self.text length] - [text length], 0)];
		}
	}
}
%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.fiore.suffissoprefs"];
	enabled = [preferences boolForKey:@"enabled"];
	suffix = [preferences objectForKey:@"suffix"];
}