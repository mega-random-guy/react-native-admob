#import "RCTConvert+GADAdSize.h"

@implementation RCTConvert (GADAdSize)

+ (GADAdSize)GADAdSize:(id)json
{
    NSString *adSize = [self NSString:json];
    if ([adSize isEqualToString:@"banner"]) {
        return kGADAdSizeBanner;
    } else if ([adSize isEqualToString:@"fullBanner"]) {
        return kGADAdSizeFullBanner;
    } else if ([adSize isEqualToString:@"largeBanner"]) {
        return kGADAdSizeLargeBanner;
    } else if ([adSize isEqualToString:@"fluid"]) {
        return kGADAdSizeFluid;
    } else if ([adSize isEqualToString:@"skyscraper"]) {
        return kGADAdSizeSkyscraper;
    } else if ([adSize isEqualToString:@"leaderboard"]) {
        return kGADAdSizeLeaderboard;
    } else if ([adSize isEqualToString:@"mediumRectangle"]) {
        return kGADAdSizeMediumRectangle;
    } else if ([adSize isEqualToString:@"smartBannerPortrait"]) {
        return kGADAdSizeSmartBannerPortrait;
    } else if ([adSize isEqualToString:@"smartBannerLandscape"]) {
        return kGADAdSizeSmartBannerLandscape;
    } else {
		NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
		NSError *error;
		
		NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
		
		if (error) {
			return kGADAdSizeInvalid;
		}
		
		NSString *width =[jsonDict objectForKey:@"w"];
		NSString *height = [jsonDict objectForKey:@"h"];
		
		NSString *joinedSize = [NSString stringWithFormat:@"{%@,%@}", width , height];
		
		return GADAdSizeFromCGSize(CGSizeFromString(joinedSize));
    }
}

@end
