//
//  ViewController.swift
//  Battery
//
//  Created by mpc on 6/27/16.
//  Copyright © 2016 mpc. All rights reserved.
//

import UIKit

enum Direction: String {
    case rising  = "and rising"
    case falling = "and falling"
    case full    = ""
    
    init() {
        self = .falling  //the most likely scenario
    }
}

class ViewController: UIViewController {
    var connected: Bool {
        return UIDevice.current.batteryState != .unplugged
    }
    
    func batteryLevel() {
        let level: Int = Int(UIDevice.current.batteryLevel * 100)
        var direction = Direction()
        
        if connected {
            direction = level == 100 ? .full : .rising
        } else {
            direction = .falling
        }

        say("Your battery level is \(String(level)) percent \(direction.rawValue)")
    }
    
    @IBAction func batteryButtonPressed(_ sender: AnyObject) {
        batteryLevel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        batteryLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

