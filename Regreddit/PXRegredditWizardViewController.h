#import <UIKit/UIKit.h>
#import "PXRegredditProgressViewController.h"

@interface PXRegredditWizardViewController : UITableViewController {
	UIDatePicker *_datePicker;
	BOOL _didStart;
	PXRegredditDeletionType _selectedType;
}
@property (nonatomic, weak, readonly) RedditService *service;
- (instancetype)initWithService:(RedditService *)service;
@end