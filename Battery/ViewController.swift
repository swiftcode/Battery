//
//  ViewController.swift
//  Battery
//
//  Created by mpc on 6/27/16.
//  Copyright © 2016 mpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func isConnected() -> Bool {
        return UIDevice.current.batteryState != .unplugged
    }
    
    func batteryLevel() {
        let level: Int = Int(UIDevice.current.batteryLevel * 100)
        var direction: String = ""
        
        if isConnected() {
            if level == 100 {
                direction = ""
            } else {
                direction = "and rising"
            }
        } else {
            direction = "and falling"
        }

        let ret = String(level)
        say("Your battery level is \(ret) percent \(direction)")
    }
    
    @IBAction func batteryButtonPressed(_ sender: AnyObject) {
        batteryLevel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        batteryLevel()
        
        //UIApplication.sharedApplication().performSelector("suspend")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

