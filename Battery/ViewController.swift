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
    case full = ""
    
    init() {
        self = .draining  //the most likely scenario
    }
}

class ViewController: UIViewController {
    var connected: Bool {
        return UIDevice.current.batteryState != .unplugged
    }
    
    var batteryLevel: String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level: Int = Int(UIDevice.current.batteryLevel * 100)
        var direction = Direction()
        
        if connected {
            direction = level == 100 ? .full : .charging
        } else {
            direction = .draining
        }
        
        return "Your battery level is \(String(level)) percent \(direction.rawValue)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        say(textToSay: batteryLevel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        say(textToSay: batteryLevel)
    }
    
    @IBAction func batteryButtonPressed(_ sender: AnyObject) {
        say(textToSay: batteryLevel)
    }
}

