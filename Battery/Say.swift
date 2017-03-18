//
//  Say.swift
//  Miles
//
//  Created by mpc on 5/19/16.
//  Copyright © 2016 mpc. All rights reserved.
//

import AVFoundation

func say(_ textToSay: String?) {
    let synth = AVSpeechSynthesizer()
    var avSpeech = AVSpeechUtterance(string: "")
    
    guard let textToSay = textToSay else {
        return
    }
    
    avSpeech = AVSpeechUtterance(string: textToSay)
    avSpeech.rate = 0.52
    synth.speak(avSpeech)
}

