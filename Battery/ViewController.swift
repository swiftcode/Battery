//
//  ViewController.swift
//  Battery
//
//  Created by mpc on 6/27/16.
//  Copyright © 2016 mpc. All rights reserved.
//

import UIKit

enum Direction: String {
    case charging  = "and charging"
    case draining = "and draining"
    case full    = ""
    
    init() {
        self = .draining  //the most likely scenario
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
            direction = level == 100 ? .full : .charging
        } else {
            direction = .draining
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

