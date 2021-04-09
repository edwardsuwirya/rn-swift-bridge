//
//  HelloWorldModule.m
//  HelloSwift
//
//  Created by Edward Suwirya on 4/8/21.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(HelloWorld,NSObject)
RCT_EXTERN_METHOD(setInitialCount: NSNumber)
RCT_EXTERN_METHOD(sayHi)
RCT_EXTERN_METHOD(sayMyName: String)
RCT_EXTERN_METHOD(counter: (RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(counterPromise: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)
@end
