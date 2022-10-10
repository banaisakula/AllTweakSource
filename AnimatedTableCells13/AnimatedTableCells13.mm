#line 1 "/Users/lovez/Desktop/AA/AA/AnimatedTableCells13/AnimatedTableCells13.xm"
BOOL hasMovedToWindow = NO;









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

@class UIScrollView; @class UITableView; 
static BOOL (*_logos_orig$_ungrouped$UIScrollView$isDragging)(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIScrollView$isDragging(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIScrollView$_scrollViewWillBeginDragging)(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UIScrollView$_scrollViewWillBeginDragging(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL); static UITableViewCell* (*_logos_orig$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$)(_LOGOS_SELF_TYPE_NORMAL UITableView* _LOGOS_SELF_CONST, SEL, NSInteger, NSIndexPath *, BOOL); static UITableViewCell* _logos_method$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$(_LOGOS_SELF_TYPE_NORMAL UITableView* _LOGOS_SELF_CONST, SEL, NSInteger, NSIndexPath *, BOOL); 

#line 10 "/Users/lovez/Desktop/AA/AA/AnimatedTableCells13/AnimatedTableCells13.xm"



static BOOL _logos_method$_ungrouped$UIScrollView$isDragging(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	hasMovedToWindow = !_logos_orig$_ungrouped$UIScrollView$isDragging(self, _cmd);
	return _logos_orig$_ungrouped$UIScrollView$isDragging(self, _cmd);
}


static void _logos_method$_ungrouped$UIScrollView$_scrollViewWillBeginDragging(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	hasMovedToWindow = NO;
	return _logos_orig$_ungrouped$UIScrollView$_scrollViewWillBeginDragging(self, _cmd);
}

 




static UITableViewCell* _logos_method$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$(_LOGOS_SELF_TYPE_NORMAL UITableView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger globalRow, NSIndexPath * indexPath, BOOL willDisplay) {
	__block UITableViewCell *result = _logos_orig$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$(self, _cmd, globalRow, indexPath, willDisplay);

	if(hasMovedToWindow) return result;

    dispatch_async(dispatch_get_main_queue(), 
	^{
		CGRect original = result.frame;
		CGRect newFrame = original;
		CGRect newFrame2 = original;
		newFrame2.origin.x -= 25;
		newFrame.origin.x += original.size.width;
		result.frame = newFrame;
		[UIView animateWithDuration: 0.25 delay: 0.0 
		options: UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionAllowAnimatedContent | UIViewAnimationOptionCurveEaseOut 
		animations: ^{ result.frame = newFrame2; }
		completion: ^(BOOL _) { [UIView animateWithDuration: 0.12 animations: ^{ result.frame = original; }]; }];
	});
    return result;
}



static __attribute__((constructor)) void _logosLocalCtor_2838023a(int __unused argc, char __unused **argv, char __unused **envp)
{
    if(![@"SpringBoard" isEqualToString: [NSProcessInfo processInfo].processName]) {Class _logos_class$_ungrouped$UIScrollView = objc_getClass("UIScrollView"); { MSHookMessageEx(_logos_class$_ungrouped$UIScrollView, @selector(isDragging), (IMP)&_logos_method$_ungrouped$UIScrollView$isDragging, (IMP*)&_logos_orig$_ungrouped$UIScrollView$isDragging);}{ MSHookMessageEx(_logos_class$_ungrouped$UIScrollView, @selector(_scrollViewWillBeginDragging), (IMP)&_logos_method$_ungrouped$UIScrollView$_scrollViewWillBeginDragging, (IMP*)&_logos_orig$_ungrouped$UIScrollView$_scrollViewWillBeginDragging);}Class _logos_class$_ungrouped$UITableView = objc_getClass("UITableView"); { MSHookMessageEx(_logos_class$_ungrouped$UITableView, @selector(_createPreparedCellForGlobalRow:withIndexPath:willDisplay:), (IMP)&_logos_method$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$, (IMP*)&_logos_orig$_ungrouped$UITableView$_createPreparedCellForGlobalRow$withIndexPath$willDisplay$);}}
}
