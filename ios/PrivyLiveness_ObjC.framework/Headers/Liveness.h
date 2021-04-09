//
//  Liveness.h
//  PrivyLiveness-ObjC
//
//  Created by Marsudi Widodo on 06/01/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LivenessData.h"
#import "LivenessType.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^LivenessSuccess)(LivenessData* result);
typedef void(^CompleteFailure)(NSInteger statusCode, NSError* error);

@interface Liveness : NSObject
- (id)initApiKey:(NSString *)apiKey secretKey:(NSString *)secretKey imageRef:(UIImage *)imageRef;

- (void)startLiveness:/*(UIViewController) viewController livenessType:(LivenessType)livenessType completion:*/(LivenessSuccess)completionBlock failure:(CompleteFailure)failureBlock;
@end

NS_ASSUME_NONNULL_END
