//
//  HelloWorld.swift
//  HelloSwift
//
//  Created by Edward Suwirya on 4/8/21.
//

import Foundation

@objc(HelloWorld)
class HelloWorld:NSObject{
  private var count = 0
  
  @objc
  func sayHi(){
    print("Hello World")
  }
  
  @objc
  func sayMyName(_ name:String){
    print("Hello "+name)
  }
  
  @objc
  func counter(_ callback: RCTResponseSenderBlock){
    count += 1
    callback([String(count)])
  }
  
  @objc
  func counterPromise(_ resolve:RCTPromiseResolveBlock,rejecter reject:RCTPromiseRejectBlock){
    if(count == 0){
      let error = NSError(domain: "", code: 500, userInfo:nil)
      reject("Error","Negative",error)
    }else{
      count -= 1
      resolve(count)
    }
  }
  @objc
  static func requiresMainQueueSetup() -> Bool{
    return true
  }
}