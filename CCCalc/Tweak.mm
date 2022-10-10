#line 1 "/Users/lovez/Desktop/AA/AA/CCCalc/Tweak.xm"
#import "CCCalcUI/CCCalcUI.h"


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

@class CCCalcButton; @class CCUIAppLauncherViewController; @class TPNumberPadDarkStyleButton; 
static id (*_logos_meta_orig$_ungrouped$CCCalcButton$imageForCharacter$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned); static id _logos_meta_method$_ungrouped$CCCalcButton$imageForCharacter$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned); static void (*_logos_orig$_ungrouped$CCCalcButton$setFrame$)(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$CCCalcButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, CGRect); static CGRect (*_logos_meta_orig$_ungrouped$CCCalcButton$circleBounds)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static CGRect _logos_meta_method$_ungrouped$CCCalcButton$circleBounds(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CCCalcButton$setGlyphLayer$)(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, CALayer *); static void _logos_method$_ungrouped$CCCalcButton$setGlyphLayer$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, CALayer *); static NSString * _logos_meta_method$_ungrouped$CCCalcButton$textForButtonID$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, unsigned); static CCCalcButton* (*_logos_orig$_ungrouped$CCCalcButton$initForCharacter$)(_LOGOS_SELF_TYPE_INIT CCCalcButton*, SEL, unsigned) _LOGOS_RETURN_RETAINED; static CCCalcButton* _logos_method$_ungrouped$CCCalcButton$initForCharacter$(_LOGOS_SELF_TYPE_INIT CCCalcButton*, SEL, unsigned) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$CCCalcButton$tapped(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CCCalcButton$setHighlighted$)(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CCCalcButton$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$)(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL, BOOL); static CGFloat (*_logos_orig$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight)(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel)(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$CCUIAppLauncherViewController$isCalcModule(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$CCCalcButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("CCCalcButton"); } return _klass; }
#line 3 "/Users/lovez/Desktop/AA/AA/CCCalc/Tweak.xm"

__attribute__((used)) static id _logos_property$_ungrouped$CCCalcButton$delegate(CCCalcButton * __unused self, SEL __unused _cmd) { return (id)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$CCCalcButton$delegate); }; __attribute__((used)) static void _logos_property$_ungrouped$CCCalcButton$setDelegate(CCCalcButton * __unused self, SEL __unused _cmd, id rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$CCCalcButton$delegate, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static BOOL _logos_property$_ungrouped$CCCalcButton$shouldStayHighlighted(CCCalcButton * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$CCCalcButton$shouldStayHighlighted); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_property$_ungrouped$CCCalcButton$setShouldStayHighlighted(CCCalcButton * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$CCCalcButton$shouldStayHighlighted, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }


static id _logos_meta_method$_ungrouped$CCCalcButton$imageForCharacter$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned character) {
	if(character == BTN_MULTIPLY || character == BTN_NEGATE) {
		NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Library/MobileSubstrate/DynamicLibraries/com.gilesgc.cccalc.bundle"];
		return [UIImage imageWithContentsOfFile:[bundle pathForResource:(character == BTN_MULTIPLY ? @"multiply" : @"plus-minus") ofType:@"png"]];
	}
	UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0,0,75,75)];
	[text setTextColor:[UIColor whiteColor]];
	[text setFont:[UIFont boldSystemFontOfSize:25]];
	[text setTextAlignment:NSTextAlignmentCenter];

	[text setText:[[self class] textForButtonID:character]];

	return [text performSelector:@selector(_image)]; 
}

static void _logos_method$_ungrouped$CCCalcButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1) {
	_logos_orig$_ungrouped$CCCalcButton$setFrame$(self, _cmd, arg1);

	for(UIView *view in [self subviews])
		[view setFrame:CGRectMake(0,0,arg1.size.width,arg1.size.height)];

	if([self character] == BTN_0) {
		for(UIView *subview in [self subviews]) {
			for(CALayer *sublayer in [[subview layer] sublayers]) {
				if([NSStringFromClass([sublayer class]) isEqualToString:@"CABackdropLayer"]) {
					
					[sublayer setFrame:CGRectMake(0,0,arg1.size.width,arg1.size.height)];
					break;
				}
			}
		}
	}
}

static CGRect _logos_meta_method$_ungrouped$CCCalcButton$circleBounds(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return CGRectMake(0,0,65,65);
}

static void _logos_method$_ungrouped$CCCalcButton$setGlyphLayer$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CALayer * layer) {
	_logos_orig$_ungrouped$CCCalcButton$setGlyphLayer$(self, _cmd, layer);
	[layer setFrame:[[self class] circleBounds]];
}

 static NSString * _logos_meta_method$_ungrouped$CCCalcButton$textForButtonID$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned identifier) {
	if(identifier <= 9) {
		return [@(identifier) stringValue];
	} else {
		switch(identifier) {
			case BTN_CLEAR:
				return @"C";
			case BTN_NEGATE:
				return @"+/-";
			case BTN_PERCENT:
				return @"%";
			case BTN_DIVIDE:
				return @"÷";
			case BTN_MULTIPLY:
				return @"✕";
			case BTN_SUBTRACT:
				return @"−";
			case BTN_ADD:
				return @"+";
			case BTN_EQUAL:
				return @"=";
			case BTN_DECIMAL:
				return @".";
			default:
				return @"";
		}
	}
}

static CCCalcButton* _logos_method$_ungrouped$CCCalcButton$initForCharacter$(_LOGOS_SELF_TYPE_INIT CCCalcButton* __unused self, SEL __unused _cmd, unsigned character) _LOGOS_RETURN_RETAINED {
	CCCalcButton *me = _logos_orig$_ungrouped$CCCalcButton$initForCharacter$(self, _cmd, character);
	[me addTarget:self action:@selector(tapped) forControlEvents:UIControlEventTouchUpInside];
	return me;
}

 static void _logos_method$_ungrouped$CCCalcButton$tapped(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if([self delegate] && [[self delegate] respondsToSelector:@selector(buttonTapped:)])
		[[self delegate] buttonTapped:[self character]];
}

static void _logos_method$_ungrouped$CCCalcButton$setHighlighted$(_LOGOS_SELF_TYPE_NORMAL CCCalcButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL h) {
	if([self shouldStayHighlighted])
		return;
	else
		_logos_orig$_ungrouped$CCCalcButton$setHighlighted$(self, _cmd, h);
}



@implementation CCCalcViewController
static CGRect _circleBounds = [_logos_static_class_lookup$CCCalcButton() circleBounds];


static int _buttonsGrid[4][4] = {
	{ BTN_CLEAR,	BTN_NEGATE, BTN_PERCENT, 	BTN_DIVIDE },
	{ BTN_7, 		BTN_8, 		BTN_9, 			BTN_MULTIPLY },
	{ BTN_4, 		BTN_5, 		BTN_6, 			BTN_SUBTRACT },
	{ BTN_1, 		BTN_2, 		BTN_3, 			BTN_ADD }
};

- (id)init {
	self = [super init];

	if(self) {
		_buttons = [[NSMutableDictionary alloc] init];

		_displayView = [[CCCalcDisplayView alloc] init];
		[_displayView setFrame:CGRectMake(0,0,100,100)];
		[[_displayView labelView] setTextColor:[UIColor whiteColor]];
		[[_displayView labelView] setFrame:CGRectMake(0,0,100,100)];
		[_displayView setText:@"0"];

		_brain = [[CCCalcBrain alloc] init];
	}

	return self;
}

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
	[[self view] addSubview:[self displayView]];
	[self initButtons];
	[self layoutButtons];
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	[self layoutButtons];
}

- (void)initButtons {
	for(int i = 0; i <= 19; i++) {
		if(i == 13)
			continue;

		CCCalcButton *button = [[_logos_static_class_lookup$CCCalcButton() alloc] initForCharacter:i];
		[[self buttons] setObject:button forKey:@(i)];
		[self.view addSubview:button];
		[button setDelegate:self];
	}
}

- (void)layoutButtons {
	
	for(int row = 0; row <= 3; row++)
		for(int column = 0; column <= 3; column++)
			[self.buttons[@(_buttonsGrid[row][column])] setFrame:[self positionAtColumn:column row:row]];

	[self.buttons[@(BTN_0)] setFrame:CGRectMake([self column:0], [self row:4], [self column:1] + _circleBounds.size.width - ((double)[self view].frame.size.width / 4.0f - _circleBounds.size.width)/2.0f, _circleBounds.size.height)];
	[self.buttons[@(BTN_DECIMAL)] setFrame:[self positionAtColumn:2 row:4]];
	[self.buttons[@(BTN_EQUAL)] setFrame:[self positionAtColumn:3 row:4]];
}

- (float)column:(unsigned int)column {
	return ((double)[self view].frame.size.width / 4.0f) * column + ((double)[self view].frame.size.width / 4.0f - _circleBounds.size.width)/2.0f;
}

- (float)row:(unsigned int)row {
	return ((double)[self view].frame.size.height / 5.0f) * row + ((double)[self view].frame.size.height / 5.0f - _circleBounds.size.height)/2.0f;
}

- (CGRect)positionAtColumn:(unsigned int)column row:(unsigned int)row {
	return CGRectMake([self column:column], [self row:row], _circleBounds.size.width, _circleBounds.size.height);
}

- (void)buttonTapped:(unsigned)identifier {
	[[self brain] evaluateTap:identifier];
	[[self displayView] setText:[[self brain] currentValueWithCommas]];

	if(identifier == BTN_ADD || identifier == BTN_SUBTRACT || identifier == BTN_MULTIPLY || identifier == BTN_DIVIDE) {
		CCCalcButton *operationButton = [self buttons][@(identifier)];
		[operationButton setShouldStayHighlighted:YES];

		for(CCCalcButton *opBtn in [self operationButtons]) {
			if(opBtn == operationButton)
				continue;
			[opBtn setShouldStayHighlighted:NO];
			[opBtn setHighlighted:NO];
		}
	} else {
		for(CCCalcButton *opBtn in [self operationButtons]) {
			[opBtn setShouldStayHighlighted:NO];
			[opBtn setHighlighted:NO];
		}
	}
}

- (NSArray<CCCalcButton *> *)operationButtons {
	return @[[self buttons][@(BTN_ADD)], [self buttons][@(BTN_SUBTRACT)], [self buttons][@(BTN_MULTIPLY)], [self buttons][@(BTN_DIVIDE)]];
}

@end

@interface CCUIAppLauncherViewController : UIViewController
- (UIView *)contentView;
- (UIImage *)glyphImage;
- (BOOL)isCalcModule;
- (UIView *)buttonView;
- (CGFloat)headerHeight;
- (CGFloat)preferredExpandedContentWidth;
@end

@interface SBFApplication : NSObject
- (NSString *)applicationBundleIdentifier;
@end

static CCCalcViewController *ccCalcController;



static void _logos_method$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL expanded) {
	_logos_orig$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$(self, _cmd, expanded);

	if(![self isCalcModule])
		return;

	if(expanded) {

		if(!ccCalcController) {
			ccCalcController = [[CCCalcViewController alloc] init];
			MSHookIvar<UIView *>(self, "_contentView") = [ccCalcController view];
			[[self view] addSubview:[ccCalcController displayView]];
			[[self view] addSubview:[ccCalcController view]];

			[[ccCalcController displayView] setFrame:CGRectMake(0,0,[self preferredExpandedContentWidth],[self headerHeight])];
		}

		for(UIView *menuItem in MSHookIvar<UIStackView *>(self, "_menuItemsContainer").arrangedSubviews) {
			[menuItem setHidden:YES];
		}

		[[ccCalcController view] setHidden:NO];
		[[ccCalcController displayView] setHidden:NO];
		[[self buttonView] setHidden:YES];
	
	} else {
		[[ccCalcController view] setHidden:YES];
		[[ccCalcController displayView] setHidden:YES];
		[[self buttonView] setHidden:NO];
	}

}

static CGFloat _logos_method$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if([self isCalcModule])
		return 525.0f;
	else
		return _logos_orig$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight(self, _cmd);
}

static void _logos_method$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if([self isCalcModule])
		return;

	_logos_orig$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel(self, _cmd);
}

 static BOOL _logos_method$_ungrouped$CCUIAppLauncherViewController$isCalcModule(_LOGOS_SELF_TYPE_NORMAL CCUIAppLauncherViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return [[MSHookIvar<SBFApplication *>(self, "_application") applicationBundleIdentifier] isEqualToString:@"com.apple.calculator"];
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$TPNumberPadDarkStyleButton = objc_getClass("TPNumberPadDarkStyleButton"); { Class _logos_class$_ungrouped$CCCalcButton = objc_allocateClassPair(_logos_class$_ungrouped$TPNumberPadDarkStyleButton, "CCCalcButton", 0); objc_registerClassPair(_logos_class$_ungrouped$CCCalcButton); Class _logos_metaclass$_ungrouped$CCCalcButton = object_getClass(_logos_class$_ungrouped$CCCalcButton); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"i\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$CCCalcButton, "delegate", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(id)); class_addMethod(_logos_class$_ungrouped$CCCalcButton, @selector(delegate), (IMP)&_logos_property$_ungrouped$CCCalcButton$delegate, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(id)); class_addMethod(_logos_class$_ungrouped$CCCalcButton, @selector(setDelegate:), (IMP)&_logos_property$_ungrouped$CCCalcButton$setDelegate, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", @encode(BOOL) }; class_addProperty(_logos_class$_ungrouped$CCCalcButton, "shouldStayHighlighted", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$CCCalcButton, @selector(shouldStayHighlighted), (IMP)&_logos_property$_ungrouped$CCCalcButton$shouldStayHighlighted, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$_ungrouped$CCCalcButton, @selector(setShouldStayHighlighted:), (IMP)&_logos_property$_ungrouped$CCCalcButton$setShouldStayHighlighted, _typeEncoding); } { MSHookMessageEx(_logos_metaclass$_ungrouped$CCCalcButton, @selector(imageForCharacter:), (IMP)&_logos_meta_method$_ungrouped$CCCalcButton$imageForCharacter$, (IMP*)&_logos_meta_orig$_ungrouped$CCCalcButton$imageForCharacter$);}{ MSHookMessageEx(_logos_class$_ungrouped$CCCalcButton, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$CCCalcButton$setFrame$, (IMP*)&_logos_orig$_ungrouped$CCCalcButton$setFrame$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$CCCalcButton, @selector(circleBounds), (IMP)&_logos_meta_method$_ungrouped$CCCalcButton$circleBounds, (IMP*)&_logos_meta_orig$_ungrouped$CCCalcButton$circleBounds);}{ MSHookMessageEx(_logos_class$_ungrouped$CCCalcButton, @selector(setGlyphLayer:), (IMP)&_logos_method$_ungrouped$CCCalcButton$setGlyphLayer$, (IMP*)&_logos_orig$_ungrouped$CCCalcButton$setGlyphLayer$);}{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(unsigned), strlen(@encode(unsigned))); i += strlen(@encode(unsigned)); _typeEncoding[i] = '\0'; class_addMethod(_logos_metaclass$_ungrouped$CCCalcButton, @selector(textForButtonID:), (IMP)&_logos_meta_method$_ungrouped$CCCalcButton$textForButtonID$, _typeEncoding); }{ MSHookMessageEx(_logos_class$_ungrouped$CCCalcButton, @selector(initForCharacter:), (IMP)&_logos_method$_ungrouped$CCCalcButton$initForCharacter$, (IMP*)&_logos_orig$_ungrouped$CCCalcButton$initForCharacter$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CCCalcButton, @selector(tapped), (IMP)&_logos_method$_ungrouped$CCCalcButton$tapped, _typeEncoding); }{ MSHookMessageEx(_logos_class$_ungrouped$CCCalcButton, @selector(setHighlighted:), (IMP)&_logos_method$_ungrouped$CCCalcButton$setHighlighted$, (IMP*)&_logos_orig$_ungrouped$CCCalcButton$setHighlighted$);} }Class _logos_class$_ungrouped$CCUIAppLauncherViewController = objc_getClass("CCUIAppLauncherViewController"); { MSHookMessageEx(_logos_class$_ungrouped$CCUIAppLauncherViewController, @selector(willTransitionToExpandedContentMode:), (IMP)&_logos_method$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$, (IMP*)&_logos_orig$_ungrouped$CCUIAppLauncherViewController$willTransitionToExpandedContentMode$);}{ MSHookMessageEx(_logos_class$_ungrouped$CCUIAppLauncherViewController, @selector(preferredExpandedContentHeight), (IMP)&_logos_method$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight, (IMP*)&_logos_orig$_ungrouped$CCUIAppLauncherViewController$preferredExpandedContentHeight);}{ MSHookMessageEx(_logos_class$_ungrouped$CCUIAppLauncherViewController, @selector(_setupTitleLabel), (IMP)&_logos_method$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel, (IMP*)&_logos_orig$_ungrouped$CCUIAppLauncherViewController$_setupTitleLabel);}{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CCUIAppLauncherViewController, @selector(isCalcModule), (IMP)&_logos_method$_ungrouped$CCUIAppLauncherViewController$isCalcModule, _typeEncoding); }} }
#line 273 "/Users/lovez/Desktop/AA/AA/CCCalc/Tweak.xm"
