#import <UIKit/UIKit.h>

%hook NSFileManager
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError * _Nullable *)error{
	if([path containsString:@"jailbreak.txt"])
  		return NO;
	return %orig;
}
- (BOOL)fileExistsAtPath:(NSString *)path{
	if([path containsString:@"Cydia.app"] || [path containsString:@"MobileSubstrate.dylib"] || [path containsString:@"/bin/bash"] || [path containsString:@"sbin/sshd"] || [path containsString:@"etc/apt"])
		return NO;
	return %orig;
}
%end

%hook NSURL
+ (instancetype)URLWithString:(NSString *)URLString{
	if([URLString containsString:@"cydia"])
		return nil;
	return %orig;
}
%end