//
//  LivenessData.h
//  PrivyLiveness-ObjC
//
//  Created by Marsudi Widodo on 06/01/21.
//

#import <Foundation/Foundation.h>
#import "AttackResult.h"
#import "Verification.h"
#import "Images.h"

NS_ASSUME_NONNULL_BEGIN

@interface LivenessData : NSObject
@property (nonatomic, strong) AttackResult *attackResult;
@property (nonatomic, assign) NSInteger timeUsed;
@property (nonatomic, strong) NSString* requestId;
@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, strong) NSString* resultMessage;
@property (nonatomic, strong) Verification *verification;
@property (nonatomic, strong) Images* images;
@property (nonatomic, strong) NSString* bizNo;
@end

NS_ASSUME_NONNULL_END
