//
//  HelloWorld.swift
//  HelloSwift
//
//  Created by Edward Suwirya on 4/8/21.
//

import Foundation
import PrivyLiveness_ObjC

@objc(HelloWorld)
class HelloWorld:NSObject{
  private var count = 0
  
  @objc
  func setInitialCount(_ initCount:NSNumber){
    count = initCount as! Int
  }
  
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
    print(count)
    count += 1
    callback([count])
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
  func doLiveness(_ callback: @escaping RCTResponseSenderBlock){
    let liveness = Liveness(apiKey: "_bYvreG6p02BotOam5YZcBkrz_qDwhuk", secretKey: "S66KAQzbwhrBUQ6rePNaoAj7iutYS9Id", imageRef: UIImage(named: "kk")!)
    liveness.start({ (data) in
      callback([">>> success liveness"])
    }, failure: { (code, error) in
      callback([">>> error liveness"])
    })
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool{
    return true
  }
}
