@interface WFTrigger : NSObject
+(BOOL)isAllowedToRunAutomatically;
@end

%hook WFTrigger
+(BOOL)isAllowedToRunAutomatically {
    return YES;
}
%end

@interface WFSharingSettings : NSObject
+(BOOL)shortcutFileSharingEnabled;
@end

%hook WFSharingSettings
+(BOOL)shortcutFileSharingEnabled {
    return YES;
}
%end

%hook VCUserNotificationManager
-(BOOL)_postNotificationOfType:(unsigned long long)type forTrigger:(id)arg2 workflowReference:(id)arg3 removeDeliveredNotifications:(BOOL)arg4 pendingTriggerEventIDs:(id)arg5 actionIcons:(id)arg6 error:(id*)arg7{
    return type == 1 ? YES : %orig; // type 1 = automation
}
%end
