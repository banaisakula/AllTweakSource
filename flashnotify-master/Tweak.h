@interface PCSimpleTimer : NSObject
@property(assign, nonatomic) BOOL disableSystemWaking;
-(instancetype)initWithTimeInterval:(double)arg1 serviceIdentifier:(NSString *)arg2 target:(id)arg3 selector:(SEL)arg4 userInfo:(id)arg5;
-(void)scheduleInRunLoop:(id)arg1;
-(void)invalidate;
-(BOOL)isValid;
@end

@interface UIImage (iOS13)
+(instancetype)systemImageNamed:(NSString *)arg1;
@end

@interface SBUIFlashlightController : NSObject
@property(assign, nonatomic) unsigned long long level;
+(instancetype)sharedInstance;
-(void)setLevel:(unsigned long long)arg1;
@end

@interface BBAppearance : NSObject
+(instancetype)appearanceWithTitle:(NSString *)arg1;
-(void)setStyle:(long long)arg1;
@end

@interface BBAction : NSObject
@property(nonatomic, copy) NSString *identifier;
+(instancetype)actionWithIdentifier:(NSString *)arg1;
+(instancetype)actionWithCallblock:(id)arg1;
+(instancetype)actionWithLaunchURL:(NSURL *)arg1 callblock:(id)arg2;
+(instancetype)actionWithLaunchURL:(NSURL *)arg1;
+(instancetype)actionWithLaunchBundleID:(NSString *)string callblock:(id)arg1;
+(instancetype)action;
-(void)setInternalBlock:(id)arg1;
-(void)setIdentifier:(NSString *)arg1;
-(void)setAppearance:(BBAppearance *)arg1;
@end

@interface BBSectionIconVariant : NSObject
+(instancetype)variantWithFormat:(long long)arg1 imageData:(NSData *)arg2;
+(instancetype)variantWithFormat:(long long)arg1 imageName:(NSString *)arg2 inBundle:(NSBundle *)arg3;
+(instancetype)variantWithFormat:(long long)arg1 imagePath:(NSString *)arg2;
@end

@interface BBSectionIcon : NSObject
-(void)addVariant:(BBSectionIconVariant *)arg1;
-(NSSet *)variants;
@end

@interface BBButton : NSObject
+(instancetype)buttonWithTitle:(NSString *)arg1 action:(BBAction *)arg2;
@end

@interface BBBulletin : NSObject
@property (nonatomic, copy) NSString *publisherBulletinID;
@end

@interface BBBulletinRequest : BBBulletin
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *section;
@property (nonatomic, copy) NSString *sectionID;
@property (nonatomic, copy) NSString *bulletinID;
@property (nonatomic, copy) NSString *bulletinVersionID;
@property (nonatomic, copy) NSString *recordID;
@property (nonatomic, copy) NSString *publisherBulletinID;
@property (assign, nonatomic) BOOL turnsOnDisplay;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSDate *lastInterruptDate;
@property (nonatomic, retain) BBSectionIcon *icon;
@property (assign, nonatomic) long long lockScreenPriority;
@property (assign, nonatomic) BOOL preventAutomaticRemovalFromLockScreen;
@property (nonatomic, assign) BBAction *defaultAction;
-(void)addButton:(BBButton *)arg1;
@end

@interface BBServer : NSObject
-(void)publishBulletinRequest:(BBBulletinRequest *)arg1 destinations:(unsigned long long)arg2;
-(void)withdrawBulletinRequestsWithPublisherBulletinID:(NSString *)arg1 forSectionID:(NSString *)arg2;
@end

@interface SBUIController
+(id)sharedInstance;
-(BOOL)isBatteryCharging;
-(BOOL)isConnectedToExternalChargingSource;
@end
