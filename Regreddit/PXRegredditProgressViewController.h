#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PXRegredditDeletionType) {
	PXRegredditDeletionTypeOverwrite = 0,
	PXRegredditDeletionTypeDelete = 1,
	PXRegredditDeletionTypePreview = 2
};

@interface PXRegredditProgressViewController : UITableViewController {
	NSMutableArray<NSArray *> *_logs;
	NSMutableArray<NSArray *> *_pushedLogs;
}
@property (nonatomic, strong, readonly) RedditService *redditService;
@property (nonatomic, assign, readonly) PXRegredditDeletionType deletionType;
@property (nonatomic, copy, readonly) NSDate *beforeDate;
- (instancetype)initWithService:(RedditService *)service
	deletionType:(PXRegredditDeletionType)deletionType
	beforeDate:(NSDate *)beforeDate;
@end