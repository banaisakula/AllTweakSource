#import "PXRegredditWizardViewController.h"

@implementation PXRegredditWizardViewController

static NSArray *_titles;
static NSDateFormatter *_dateFormatter;
static NSArray *_deletionOptions;

+ (void)load {
	if (self == [PXRegredditWizardViewController class]) {
		_dateFormatter = [NSDateFormatter new];
		_dateFormatter.timeStyle = NSDateFormatterShortStyle;
		_dateFormatter.dateStyle = NSDateFormatterLongStyle;
		_titles = @[
			@"Delete Comments Before...",
			@"Deletion Type",
			@""
		];
		_deletionOptions = @[
			@"Overwrite",
			@"Delete",
			@"Preview (No deletion)"
		];
	}
}

- (__kindof UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	return (section == 0) ? _datePicker : nil;
}

- (void)dateDidChange:(UIDatePicker *)datePicker {
	[self.tableView
		reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
		withRowAnimation:UITableViewRowAnimationNone
	];
}

- (void)didPressCancel {
	if (!_didStart) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}

- (instancetype)initWithService:(RedditService *)service {
	if ((self = [super initWithStyle:UITableViewStyleGrouped])) {
		self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
			initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
			target:self
			action:@selector(didPressCancel)
		];
		_service = service;
		_datePicker = [UIDatePicker new];
		_datePicker.datePickerMode = UIDatePickerModeDateAndTime;
		_datePicker.date = _datePicker.maximumDate = [NSDate date];
		_datePicker.minimumDate = [NSDate dateWithTimeIntervalSince1970:1117584000];
		[_datePicker
			addTarget:self
			action:@selector(dateDidChange:)
			forControlEvents:UIControlEventValueChanged
		];
		self.tableView.delegate = self;
		self.tableView.dataSource = self;
		self.title = @"Comment Deleter";
	}
	return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	switch (indexPath.section) {
		case 1: {
			NSInteger oldRow = _selectedType;
			_selectedType = indexPath.row;
			[self.tableView
				reloadRowsAtIndexPaths:@[
					[NSIndexPath indexPathForRow:oldRow inSection:1],
					[NSIndexPath indexPathForRow:indexPath.row inSection:1],
					[NSIndexPath indexPathForRow:0 inSection:2]
				]
				withRowAnimation:UITableViewRowAnimationNone
			];
			break;
		}
		case 2: {
			void(^continueHandler)(UIAlertAction *) = ^(UIAlertAction * action){
				_didStart = YES;
				if (@available(iOS 13.0, *)) {
					self.modalInPresentation = YES;
				}
				[self.navigationController
					pushViewController:[[PXRegredditProgressViewController alloc]
						initWithService:_service
						deletionType:_selectedType
						beforeDate:_datePicker.date
					]
					animated:YES
				];
			};
			if (_selectedType == PXRegredditDeletionTypePreview) {
				continueHandler(nil);
				break;
			}
			UIAlertController *alert = [UIAlertController
				alertControllerWithTitle:@"Warning"
				message:[NSString
					stringWithFormat:@"This action cannot be undone. All comments from %@ created before the specified date will be deleted from Reddit. Are you sure you want to continue?",
					_service.account.user.displayNamePrefixed
				]
				preferredStyle:UIAlertControllerStyleAlert
			];
			[alert addAction:[UIAlertAction
				actionWithTitle:@"Continue"
				style:UIAlertActionStyleDestructive
				handler:continueHandler
			]];
			[alert addAction:[UIAlertAction
				actionWithTitle:@"Cancel"
				style:UIAlertActionStyleCancel
				handler:nil
			]];
			[self presentViewController:alert animated:YES completion:nil];
		}
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return _titles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0: return 1;
		case 1: return _deletionOptions.count;
		case 2: return 1;
	}
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:@"cell"
		];
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.selectionStyle = UITableViewCellSelectionStyleDefault;
		if (@available(iOS 13.0, *)) {
			cell.textLabel.textColor = [UIColor labelColor];
		}
		else {
			cell.textLabel.textColor = [UIColor whiteColor];
		}
		cell.textLabel.textAlignment = NSTextAlignmentNatural;
	}
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [_dateFormatter stringFromDate:_datePicker.date];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			break;
		case 1:
			cell.textLabel.text = _deletionOptions[indexPath.row];
			if (_selectedType == indexPath.row) {
				cell.accessoryType = UITableViewCellAccessoryCheckmark;
			}
			break;
		case 2:
			if (_selectedType == PXRegredditDeletionTypePreview) {
				cell.textLabel.text = @"Preview";
				cell.textLabel.textColor = cell.tintColor;
			}
			else {
				cell.textLabel.text = @"Start Deleting";
				cell.textLabel.textColor = [UIColor redColor];
			}
			cell.textLabel.textAlignment = NSTextAlignmentCenter;
			break;
	}
	return cell;
}

@end