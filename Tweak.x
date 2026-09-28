#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Hook entry — نسوي swizzle على NSUserDefaults
// عشان نرجع YES لأي مفتاح فيه premium/subscription
%hook NSUserDefaults

- (id)objectForKey:(NSString *)key {
    if ([key containsString:@"premium"] ||
        [key containsString:@"subscri"] ||
        [key containsString:@"isPro"] ||
        [key containsString:@"purchased"] ||
        [key containsString:@"unlocked"]) {
        return @YES;
    }
    return %orig;
}

- (BOOL)boolForKey:(NSString *)key {
    if ([key containsString:@"premium"] ||
        [key containsString:@"subscri"] ||
        [key containsString:@"isPro"] ||
        [key containsString:@"purchased"] ||
        [key containsString:@"unlocked"] ||
        [key containsString:@"watermark"]) {
        // watermark نرجع NO عشان يختفي
        if ([key containsString:@"watermark"]) return NO;
        return YES;
    }
    return %orig;
}

%end
