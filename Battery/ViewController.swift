//
//  ViewController.swift
//  Battery
//
//  Created by mpc on 6/27/16.
//  Copyright © 2016 mpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func batteryLevel() {
        
        let level: Int = Int(UIDevice.currentDevice().batteryLevel * 100)
        let ret = String(level)
        say("Your battery level is \(ret) percent")
    }
    
    func isConnected() {
        if (UIDevice.currentDevice().batteryState != .Unplugged) {
            say("Device is connected")
        } else {
            say("Device is disconnected")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.currentDevice().batteryMonitoringEnabled = true
        //isConnected()
        batteryLevel()
        
        //UIApplication.sharedApplication().performSelector("suspend")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

