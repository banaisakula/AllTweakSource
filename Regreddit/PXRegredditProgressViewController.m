#import "PXRegredditProgressViewController.h"

typedef NS_ENUM(NSInteger, PXRegredditCompletion) {
	PXRegredditCompletionSuccess = 0,
	PXRegredditCompletionWithErrors = 1,
	PXRegredditCompletionFailure = 2
};

@implementation PXRegredditProgressViewController

- (void)didPressDoneButton {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logsPush {
	if (_pushedLogs) {
		[NSException raise:NSInvalidArgumentException format:@"Attemted to push logs before popping."];
	}
	_pushedLogs = [_logs mutableCopy];
}

- (void)logWithTitle:(NSString *)title
	description:(NSString *)description
	error:(BOOL)error
{
	NSArray *newLog = @[
		title,
		description,
		@(error)
	];
	if (_pushedLogs) {
		[_pushedLogs insertObject:newLog atIndex:0];
		return;
	}
	dispatch_sync(dispatch_get_main_queue(), ^{
		[_logs insertObject:newLog atIndex:0];
		[self.tableView
			insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
			withRowAnimation:UITableViewRowAnimationAutomatic
		];
	});
}

- (void)logsPop {
	if (!_pushedLogs) {
		[NSException raise:NSInvalidArgumentException format:@"No logs were pushed."];
	}
	dispatch_sync(dispatch_get_main_queue(), ^{
		_logs = _pushedLogs;
		_pushedLogs = nil;
		[self.tableView reloadData];
	});
}

- (NSDictionary *)performAuthenticatedRequestWithMethod:(NSString *)method
	URL:(NSString *)URL
	data:(NSString *)body
	response:(out NSHTTPURLResponse **)responsePt
	error:(out NSError **)errorPt
{
	NSHTTPURLResponse *response = nil;
	NSError *error = nil;
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL]];
	request.HTTPMethod = method;
	[request
		setValue:[NSString stringWithFormat:@"Bearer %@", _redditService.credentials.tokenString]
		forHTTPHeaderField:@"Authorization"
	];
	[request
		setValue:_redditService.account.user.pk
		forHTTPHeaderField:@"Reddit-User_Id"
	];
	[request
		setValue:@"iOS:Regreddit:1.0 (by u/pxOMR)"
		forHTTPHeaderField:@"User-Agent"
	];
	request.HTTPBody = [body dataUsingEncoding:NSASCIIStringEncoding];
	NSData *data = nil;
	while (!response || response.statusCode == 429) {
		response = nil;
		data = [NSURLConnection
			sendSynchronousRequest:request
			returningResponse:&response
			error:&error
		];
		if (response.statusCode == 429) {
			[self logWithTitle:@"Client got rate-limited" description:[NSString
				stringWithFormat:@"Received HTTP 429 (Too Many Requests). Will wait for %@ second(s) and continue.",
				response.allHeaderFields[@"Retry-After"] ?: @"2"
			] error:NO];
			sleep([(response.allHeaderFields[@"Retry-After"] ?: @"2") intValue]);
		}
		else {
			sleep(2);
		}
	}
	NSDictionary *result = nil;
	if (data) {
		result = [NSJSONSerialization
			JSONObjectWithData:data
			options:0
			error:&error
		];
	}
	if (errorPt) *errorPt = error;
	if (responsePt) *responsePt = response;
	return result;
}

- (PXRegredditCompletion)performDeletion {
	NSString *nextPageID = @"";
	NSMutableArray *commentsToDelete = [NSMutableArray new];
	NSHTTPURLResponse *response = nil;
	NSTimeInterval timeInterval = [_beforeDate timeIntervalSince1970];
	NSError *error = nil;
	[self logWithTitle:@"Fetching comments..." description:@"This might take a while." error:NO];
	while ([nextPageID isKindOfClass:[NSString class]]) {
		// Find the comments that are going to be deleted
		NSDictionary *result = [self
			performAuthenticatedRequestWithMethod:@"GET"
			URL:[NSString
				stringWithFormat:@"https://reddit.com/%@/comments.json?sort=new&t=all&type=comments&limit=100&after=%@",
				_redditService.account.user.displayNamePrefixed,
				nextPageID
			]
			data:nil
			response:&response
			error:&error
		];
		if (!result || error || (response.statusCode != 200)) {
			[self
				logWithTitle:@"Failed to fetch comments"
				description:[NSString
					stringWithFormat:@"An error occurred while fetching comments.\nHTTP status: %ld\nError: %@\nJSON: %@",
					(long)response.statusCode,
					error.localizedDescription,
					result
				]
				error:YES
			];
			return PXRegredditCompletionFailure;
		}
		NSDictionary *listingData = result[@"data"];
		nextPageID = listingData[@"after"];
		NSArray<NSDictionary<NSString *, id> *> *children = listingData[@"children"];
		for (NSDictionary<NSString *, id> *comment in children) {
			NSDictionary *commentData = comment[@"data"];
			NSTimeInterval commentInterval = [(commentData[@"created_utc"] ?: @(CGFLOAT_MAX)) doubleValue];
			if (commentInterval < timeInterval) {
				[commentsToDelete addObject:@{
					@"body" : commentData[@"body"],
					@"id" : commentData[@"id"]
				}];
			}
		}
		NSLog(@"Next page: %@", nextPageID);
	}
	[self logWithTitle:@"Finished fetching comments." description:@"Operation will start shortly." error:NO];
	PXRegredditCompletion state = PXRegredditCompletionSuccess;
	if (_deletionType == PXRegredditDeletionTypePreview) {
		[self logsPush];
	}
	for (NSDictionary *comment in commentsToDelete) {
		error = nil;
		response = nil;
		switch (_deletionType) {
			case PXRegredditDeletionTypeDelete:
				[self
					performAuthenticatedRequestWithMethod:@"POST"
					URL:@"https://oauth.reddit.com/api/del"
					data:[NSString stringWithFormat:@"id=t1_%@", comment[@"id"]]
					response:&response
					error:&error
				];
				break;
			case PXRegredditDeletionTypeOverwrite:
				[self
					performAuthenticatedRequestWithMethod:@"POST"
					URL:@"https://oauth.reddit.com/api/editusertext"
					data:[NSString
						stringWithFormat:(
							@"api_type=json&"
							@"text=%@&"
							@"thing_id=t1_%@"
						),
						@"%2A%2AThis%20comment%20was%20automatically%20deleted%20by%20%5BRegreddit%5D%28https%3A%2F%2Fgithub.com%2Fpixelomer%2FRegreddit%29.%2A%2A",
						comment[@"id"]
					]
					response:&response
					error:&error
				];
				break;
			case PXRegredditDeletionTypePreview:
				break;
		}
		if (_deletionType == PXRegredditDeletionTypePreview) {
			[self
				logWithTitle:[NSString stringWithFormat:@"Would delete \"%@\"", comment[@"id"]]
				description:comment[@"body"]
				error:NO
			];
			//usleep(200000);
			continue;
		}
		if (response && (response.statusCode == 200) && !error) {
			[self
				logWithTitle:[NSString stringWithFormat:@"Deleted \"%@\"", comment[@"id"]]
				description:comment[@"body"]
				error:NO
			];
		}
		else {
			[self
				logWithTitle:[NSString stringWithFormat:@"Failed to delete \"%@\" (%ld)", comment[@"id"], (long)response.statusCode]
				description:comment[@"body"]
				error:YES
			];
			state = PXRegredditCompletionWithErrors;
		}
	}
	if (_deletionType == PXRegredditDeletionTypePreview) {
		[self logsPop];
	}
	return state;
}

- (void)performDeletion:(id)unused {
	PXRegredditCompletion state = [self performDeletion];
	NSString *message = nil;
	switch (state) {
		case PXRegredditCompletionSuccess:
			message = @"Operation completed succesfully.";
			break;
		case PXRegredditCompletionWithErrors:
			message = @"Operation completed with one or more errors.";
			break;
		case PXRegredditCompletionFailure:
			message = @"Operation failed.";
			break;
	}
	[self
		logWithTitle:@"Done"
		description:message
		error:NO
	];
	dispatch_async(dispatch_get_main_queue(), ^{
		UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
			initWithBarButtonSystemItem:UIBarButtonSystemItemDone
			target:self
			action:@selector(didPressDoneButton)
		];
		self.navigationItem.rightBarButtonItem = doneButton;
	});
}

- (instancetype)initWithService:(RedditService *)service
	deletionType:(PXRegredditDeletionType)deletionType
	beforeDate:(NSDate *)beforeDate
{
	if ((self = [super initWithStyle:UITableViewStylePlain])) {
		_beforeDate = beforeDate;
		_deletionType = deletionType;
		_redditService = service;
		_logs = [NSMutableArray new];
		self.title = @"Progress";
		[NSThread
			detachNewThreadSelector:@selector(performDeletion:)
			toTarget:self
			withObject:nil
		];
	}
	return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return _logs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[UITableViewCell alloc]
			initWithStyle:UITableViewCellStyleSubtitle
			reuseIdentifier:@"cell"
		];
		cell.detailTextLabel.numberOfLines = 5;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	cell.textLabel.text = _logs[indexPath.row][0];
	cell.detailTextLabel.text = _logs[indexPath.row][1];
	if ([_logs[indexPath.row][2] boolValue]) {
		cell.textLabel.textColor = [UIColor redColor];
	}
	else if (@available(iOS 13.0, *)) {
		cell.textLabel.textColor = [UIColor labelColor];
	}
	else {
		cell.textLabel.textColor = [UIColor blackColor];
	}
	return cell;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.hidesBackButton = YES;
}

@end