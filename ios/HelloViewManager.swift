//
//  HelloViewManager.swift
//  HelloSwift
//
//  Created by Edward Suwirya on 4/9/21.
//

import UIKit
import PrivyLiveness_ObjC

@objc(HelloViewManager)
class HelloViewManager: RCTViewManager {
  var liveness:Liveness?
  
  override func view() -> UIView! {
    let button = UIButton()
    button.backgroundColor = UIColor.lightGray
    button.setTitle("Hello From Swift", for: UIControl.State.normal)
    button.tintColor = UIColor.blue
    button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
    return button
  }
  
  @objc
  func buttonAction(_ sender:UIButton!){
    liveness = Liveness(apiKey: "_bYvreG6p02BotOam5YZcBkrz_qDwhuk", secretKey: "S66KAQzbwhrBUQ6rePNaoAj7iutYS9Id", imageRef: UIImage(named: "kk")!)
    self.liveness?.start({ (data) in
        print(">>> success liveness")
        print(data.verification.ref1.confidence)
    }, failure: { (code, error) in
        print(">>> error liveness")
        print(error)
    })
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}
