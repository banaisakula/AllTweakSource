#line 1 "Tweak.xm"




@interface UICalloutBar : UIView
@property (nonatomic,readonly) bool isDisplayingVertically;
@property (nonatomic, retain) NSArray *extraItems;
@property (nonatomic, retain) UIMenuItem *rektItem;
@end

@interface UICalloutBarButton : UIButton
@property (nonatomic, assign) SEL action;
@end

static NSString *mode = nil;

NSString *emojichosen = nil;

static NSDictionary *pirateTalk = @{
    @"hello": @"ahoy",
    @"hi": @"arrr",
   @"my":@"me",
   @"friend":@"m'hearty",
   @"boy":@"laddy",
   @"girl":@"lassie",
   @"sir":@"matey",
   @"miss":@"proud beauty",
   @"stranger":@"scurvy dog",
   @"boss":@"foul blaggart",
   @"where":@"whar",
   @"it is":@"'tis",
   @"am":@"be",
   @"it":@"thy",
   @"the":@"Th'",
   @"what":@"shiver me timbers",
   @"is":@"be",
   @"the":@"th'",
   @"you":@"ye",
   @"old":@"barnacle covered",
   @"happy":@"grog-filled",
   @"nearby":@"broadside",
   @"bathroom":@"head",
   @"kitchen":@"galley",
   @"pub":@"fleabag inn",
   @"stop":@"avast",
   @"yes":@"aye",
   @"no":@"nay",
   @"yay":@"yo-ho-ho",
   @"money":@"doubloons",
   @"treasure":@"booty",
   @"strong":@"heave-ho",
   @"take":@"pillage",
   @"drink":@"grog",
   @"idiot":@"scallywag",
   @"sea":@"briney deep",
   @"vote":@"mutiny",
   @"song":@"shanty",
   @"drunk":@"three sheets to the wind",
   @"lol":@"yo ho ho",
   @"talk":@"parley",
   @"fail":@"scupper",
   @"quickly":@"smartly",
   @"captain":@"cap'n",
   @"stop":@"avast",
   @"kill":@"blow the man down",
   @"surprise":@"bring a spring upon her cable",
   @"behave":@"chase ye' code of conduc",
   @"turn around":@"come about",
   @"stip club":@"crack jenny's tea cup",
   @"trick":@"crimp",
   @"hang":@"dance the hempen jig",
   @"cementery":@"davy jones' locker",
   @"survivor":@"dead man tell no tales",
   @"refuse":@"give no quarter",
   @"god":@"blimey",
   @"mate":@"bucko",
   @"belong":@"duffle",
   @"joint":@"shroud",
   @"naughty":@"scallywag",
   @"steal":@"plunder",
   @"ok":@"savvy",
   @"going":@"goin'",
   @"with":@"wit'",
   @"mission":@"party",
   @"adventure":@"party",
   @"to":@"t'",
   @"do":@"be",
   @"agreement":@"partie"
};

static NSDictionary *mimi = @{
  @"a":@"i",
  @"e":@"i",
  @"o":@"i",
  @"u":@"i"
};

static NSDictionary *australiandict = @{
  @"z":@"z",
  @"y":@"ʎ",
  @"x":@"x",
  @"w":@"ʍ",
  @"v":@"ʌ",
  @"u":@"n",
  @"t":@"ʇ",
  @"s":@"s",
  @"r":@"ɹ",
  @"q":@"b",
  @"p":@"d",
  @"o":@"o",
  @"n":@"u",
  @"m":@"ɯ",
  @"l":@"ן",
  @"k":@"ʞ",
  @"j":@"ظ",
  @"i":@"ı",
  @"h":@"ɥ",
  @"g":@"b",
  @"f":@"ɟ",
  @"e":@"ǝ",
  @"d":@"p",
  @"c":@"ɔ",
  @"b":@"q",
  @"a":@"ɐ",
  @",":@"'",
  @"'":@",",
  @"?":@"¿"
};

NSString *mimify (NSString *text) {
    NSString *temp = [text copy];

    if (mimi) {
        for (NSString *key in mimi) {
            temp = [temp stringByReplacingOccurrencesOfString:key withString:mimi[key]];
        }
    }

    return [@" " stringByAppendingString:temp];
}

NSString *piratefy (NSString *text) {
    NSString *temp = [text copy];
    temp = [temp lowercaseString];
    NSArray *textNoArray = [temp componentsSeparatedByString:@" "];
    NSMutableArray *textArray = [textNoArray mutableCopy];

    if (pirateTalk) {
        for (NSString *key in pirateTalk) {
            if ([textArray containsObject:key]) {
              NSUInteger objectIndex = [textArray indexOfObject:key];
              [textArray replaceObjectAtIndex:objectIndex withObject:pirateTalk[key]];
            }
        }
    }
    NSString *lowerCase = [textArray componentsJoinedByString:@" "];
    lowerCase = [lowerCase lowercaseString];
    return lowerCase;
}


NSString *rektify (NSString *texttochange) {
    NSString *temp = [texttochange copy];

    float randonmess = 0.5;
	NSMutableString *finalText = [@"" mutableCopy];
	for (int i=0; i<temp.length; i++) {
	    NSString *charSelected = [temp substringWithRange:NSMakeRange(i, 1)];
	    BOOL toUpperOrNotToUpper = arc4random_uniform(1000) / 1000.0 < randonmess;
	    if (toUpperOrNotToUpper) {
	        charSelected = [charSelected uppercaseString];
	    }
	    [finalText appendString:charSelected];
	}
    return finalText;
}

NSString *clap (NSString *texttochange) {
    NSString *temp = [texttochange copy];

    
    NSMutableString *finalText = [@"" mutableCopy];
    for (int i=0; i<temp.length; i++) {
        NSString *charSelected = [temp substringWithRange:NSMakeRange(i, 1)];
        if ([charSelected isEqualToString:@" "]) {
            charSelected = emojichosen;
        }
        [finalText appendString:charSelected];
    }
    return finalText;
}

NSString *spaceify (NSString *texttochange) {
    NSString *temp = [texttochange copy];

    
    NSMutableString *finalText = [@"" mutableCopy];
    for (int i=0; i<temp.length; i++) {
        NSString *charSelected = [temp substringWithRange:NSMakeRange(i, 1)];
        if ([charSelected isEqualToString:@" "]) {
            charSelected = @" ";
        } else {
          charSelected = [NSString stringWithFormat:@"%@ ",charSelected];
        }
        [finalText appendString:charSelected];
    }
    return finalText;
}

NSString *lmgtfy (NSString *texttochange) {
    NSString *fix = [texttochange stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return [NSString stringWithFormat:@"http://www.lmgtfy.com/?iie=1&q=%@", fix];
}

NSString *revert (NSString *texttochange) {
  NSString *temp = [texttochange copy];
  NSMutableArray *textArray = [[NSMutableArray alloc] init];
  for (int i = 0; i < temp.length; i++) {
    NSString *character = [temp substringWithRange:NSMakeRange(i, 1)];
    [textArray addObject:character];
  }
  int j = [textArray count] - 1;
  for (int i = 0; i < j; i++) {
    [textArray exchangeObjectAtIndex:i withObjectAtIndex:j];
    j--;
  }
  return [textArray componentsJoinedByString:@""];
}

NSString *australianify (NSString *text) {
    NSString *temp = revert(text);
    temp = [temp lowercaseString];

    if (australiandict) {
        for (NSString *key in australiandict) {
            temp = [temp stringByReplacingOccurrencesOfString:key withString:australiandict[key]];
        }
    }

    return [@" " stringByAppendingString:temp];
}


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

@class UIResponder; @class UICalloutBar; 


#line 243 "Tweak.xm"
static UICalloutBar* (*_logos_orig$SelectRekt$UICalloutBar$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UICalloutBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UICalloutBar* _logos_method$SelectRekt$UICalloutBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT UICalloutBar*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$SelectRekt$UICalloutBar$updateAvailableButtons)(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$SelectRekt$UICalloutBar$updateAvailableButtons(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$SelectRekt$UIResponder$rektTheText$(_LOGOS_SELF_TYPE_NORMAL UIResponder* _LOGOS_SELF_CONST, SEL, UIResponder *); 

__attribute__((used)) static UIMenuItem * _logos_method$SelectRekt$UICalloutBar$rektItem(UICalloutBar * __unused self, SEL __unused _cmd) { return (UIMenuItem *)objc_getAssociatedObject(self, (void *)_logos_method$SelectRekt$UICalloutBar$rektItem); }; __attribute__((used)) static void _logos_method$SelectRekt$UICalloutBar$setRektItem(UICalloutBar * __unused self, SEL __unused _cmd, UIMenuItem * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$SelectRekt$UICalloutBar$rektItem, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static UICalloutBar* _logos_method$SelectRekt$UICalloutBar$initWithFrame$(_LOGOS_SELF_TYPE_INIT UICalloutBar* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
    UICalloutBar *orig = _logos_orig$SelectRekt$UICalloutBar$initWithFrame$(self, _cmd, arg1);
    self.rektItem = [[UIMenuItem alloc] initWithTitle:@"rEkT" action:@selector(rektTheText:)];
    return orig;
}

static void _logos_method$SelectRekt$UICalloutBar$updateAvailableButtons(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$SelectRekt$UICalloutBar$updateAvailableButtons(self, _cmd);
    if (!self.extraItems) {
        self.extraItems = @[];
    }
    bool display = false;
    NSArray *currentSystemButtons = MSHookIvar<NSArray *>(self, "m_currentSystemButtons");
    for (UICalloutBarButton *btn in currentSystemButtons) {
        if (btn.action == @selector(cut:)) {
            display = true;
        } else if (btn.action == @selector(paste:)) {
            display = true;
        }
    }
    NSMutableArray *items = [self.extraItems mutableCopy];
    if (display) {
        if (![items containsObject:self.rektItem]) {
            [items addObject:self.rektItem];
        }
    } else {
        [items removeObject:self.rektItem];
    }
    self.extraItems = items;
    _logos_orig$SelectRekt$UICalloutBar$updateAvailableButtons(self, _cmd);
}





static void _logos_method$SelectRekt$UIResponder$rektTheText$(_LOGOS_SELF_TYPE_NORMAL UIResponder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIResponder * sender) {
    NSString *originalText = [[UIPasteboard generalPasteboard].string copy];
    [[UIApplication sharedApplication] sendAction:@selector(cut:) to:nil from:self forEvent:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString *selectedText = [[UIPasteboard generalPasteboard].string copy];
        if (selectedText) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"How do you wanna mess with this kid?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *clapaction = [UIAlertAction actionWithTitle:@"Choose Emoji" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              UITextField *textFieldAlert;
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose Emoji" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                  textField.text = @"👏";
                }];
                UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                  emojichosen = [[alertController textFields][0] text];
                  [[UIPasteboard generalPasteboard] setString:clap(selectedText)];
                  [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
                }];
                [alertController addAction:confirmAction];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
                [alertController addAction:cancelAction];
                [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{}];

              }];
            [alertController addAction:clapaction];

            UIAlertAction *googleAction = [UIAlertAction actionWithTitle:@"Let Me Google That For You" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:lmgtfy(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];

              }];
              [alertController addAction:googleAction];

              UIAlertAction *rEkTaction = [UIAlertAction actionWithTitle:@"rEkT" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:rektify(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:rEkTaction];

              UIAlertAction *piratefyAction = [UIAlertAction actionWithTitle:@"Arrr" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:piratefy(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:piratefyAction];

              UIAlertAction *spaceAction = [UIAlertAction actionWithTitle:@"S p a c e" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:spaceify(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:spaceAction];

              UIAlertAction *revertAction = [UIAlertAction actionWithTitle:@"trever" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:revert(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:revertAction];

              UIAlertAction *mimiaction = [UIAlertAction actionWithTitle:@"Mimi" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:mimify(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:mimiaction];

              UIAlertAction *australian = [UIAlertAction actionWithTitle:@"Kangoroo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIPasteboard generalPasteboard] setString:australianify(selectedText)];
                [[UIApplication sharedApplication] sendAction:@selector(paste:) to:nil from:self forEvent:nil];
              }];
              [alertController addAction:australian];

              UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
              }];
              [alertController addAction:cancelAction];
              UIViewController *viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
              if ( viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed ) {
                  viewController = viewController.presentedViewController;
              }

              NSLayoutConstraint *constraint = [NSLayoutConstraint
                  constraintWithItem:alertController.view
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationLessThanOrEqual
                  toItem:nil
                  attribute:NSLayoutAttributeNotAnAttribute
                  multiplier:1
                  constant:viewController.view.frame.size.height*2.0f];

              [alertController.view addConstraint:constraint];
              [viewController presentViewController:alertController animated:YES completion:^{}];
        }

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            if (originalText) {
                [[UIPasteboard generalPasteboard] setString:originalText];
            } else {
                [[UIPasteboard generalPasteboard] setString:@""];
            }
        });
    });
}





static __attribute__((constructor)) void _logosLocalCtor_75358053(int __unused argc, char __unused **argv, char __unused **envp) {
    
    
    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if (!isFileProvider && isApplication && !skip) {
                shouldLoad = YES;
            }
        }
    }

    if (!shouldLoad) return;
    {Class _logos_class$SelectRekt$UICalloutBar = objc_getClass("UICalloutBar"); { MSHookMessageEx(_logos_class$SelectRekt$UICalloutBar, @selector(initWithFrame:), (IMP)&_logos_method$SelectRekt$UICalloutBar$initWithFrame$, (IMP*)&_logos_orig$SelectRekt$UICalloutBar$initWithFrame$);}{ MSHookMessageEx(_logos_class$SelectRekt$UICalloutBar, @selector(updateAvailableButtons), (IMP)&_logos_method$SelectRekt$UICalloutBar$updateAvailableButtons, (IMP*)&_logos_orig$SelectRekt$UICalloutBar$updateAvailableButtons);}{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIMenuItem *)); class_addMethod(_logos_class$SelectRekt$UICalloutBar, @selector(rektItem), (IMP)&_logos_method$SelectRekt$UICalloutBar$rektItem, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIMenuItem *)); class_addMethod(_logos_class$SelectRekt$UICalloutBar, @selector(setRektItem:), (IMP)&_logos_method$SelectRekt$UICalloutBar$setRektItem, _typeEncoding); } Class _logos_class$SelectRekt$UIResponder = objc_getClass("UIResponder"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIResponder *), strlen(@encode(UIResponder *))); i += strlen(@encode(UIResponder *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$SelectRekt$UIResponder, @selector(rektTheText:), (IMP)&_logos_method$SelectRekt$UIResponder$rektTheText$, _typeEncoding); }}
}
