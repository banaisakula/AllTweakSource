#import <Foundation/Foundation.h>
#import "PXRegredditWizardViewController.h"

// See the -[UserDrawerViewController tableView:cellForRowAtIndexPath:]
// to see why the __regreddit_readonly property is added to UIImageView
// and UITableViewLabel.

%hook UIImageView
%property (nonatomic, assign) BOOL __regreddit_readonly;

- (void)setImage:(UIImage *)image {
	if (!self.__regreddit_readonly) %orig;
}

%end

%hook UITableViewLabel
%property (nonatomic, assign) BOOL __regreddit_readonly;

- (void)setText:(NSString *)text {
	if (!self.__regreddit_readonly) %orig;
}

%end

%hook UserDrawerViewController

%new
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return (section == 1) ? 1 : (%orig);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section != 1) {
		return %orig;
	}
	NSString * const cellID = @"__regreddit_cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (!cell) {
		cell = [(UITableViewCell *)[%c(UserDrawerActionTableViewCell) alloc]
			initWithStyle:UITableViewCellStyleSubtitle
			reuseIdentifier:cellID
		];
		cell.textLabel.text = @"Comment Deleter";
		cell.imageView.image = [UIImage imageNamed:@"icon_delete_20"];

		// Something in the Reddit code modifies some UITableViewCell data
		// after it is returned from "tableView:cellForRowAtIndexPath:".
		// To get around this, I added a property to UITableViewLabel
		// and UIImageView called __regreddit_readonly. When this property
		// is set to true, messages -[UITableViewLabel setText:] and
		// -[UIImageView setImage:] are ignored. This is probably not the
		// best solution, but it works ¯\_(ツ)_/¯
		((UITableViewLabel *)cell.textLabel).__regreddit_readonly = YES;
		cell.imageView.__regreddit_readonly = YES;
	
	}
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section != 1) {
		%orig;
		return;
	}
	RedditService *service = self.accountContext.redditService;
	UINavigationController *navigationController = [[UINavigationController alloc]
		initWithRootViewController:[[PXRegredditWizardViewController alloc]
			initWithService:service
		]
	];
	[self
		presentViewController:navigationController
		animated:YES
		completion:^{
			[tableView deselectRowAtIndexPath:indexPath animated:NO];
		}
	];
	return;
}

%end