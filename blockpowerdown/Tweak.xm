BOOL enabled;

//Change this to your postNotification from your settings.
static NSString *nsNotificationString = @"com.lacertosusrepo.stellaeprefs/preferences.changed";
static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  loadPrefs();
}

static void loadPrefs() {
NSString *preferencesPath = @"/User/Library/Preferences/com.YOUR.PREFERENCESFILE.plist";
NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:preferencesPath];
  if(!preferences) {
    preferences = [[NSMutableDictionary alloc] init];
    enabled = YES; //or NO
  } else {
    enabled = [[preferences objectForKey:@"yourSwitch"] boolValue];
  }
[preferences release];
}

%ctor {
  NSAutoreleasePool *pool = [NSAutoreleasePool new];
  loadPrefs();
  notificationCallback(NULL, NULL, NULL, NULL, NULL);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
  [pool release];
}

%hook SBPowerDownController

- (void)orderFront{

UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hey!"
message:@"Why are you trying to shutdown my phone?"
delegate:self cancelButtonTitle: @"Cancel"
otherButtonTitles:nil];

[alert show];

}
%end
