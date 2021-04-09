//
//  AttackResult.h
//  PrivyLiveness-ObjC
//
//  Created by Marsudi Widodo on 06/01/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AttackResult : NSObject
@property (nonatomic, assign) double threshold;
@property (nonatomic, assign) BOOL result;
@property (nonatomic, assign) double score;
@end

NS_ASSUME_NONNULL_END
