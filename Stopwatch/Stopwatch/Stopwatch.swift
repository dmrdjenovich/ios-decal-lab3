//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by David Mrdjenovich on 2/16/17.
//  Copyright © 2017 David Mrdjenovich. All rights reserved.
//

import Foundation
import UIKit

class Stopwatch {
    
    var date : Date
    var delta : Double
    
    
    init () {
        date = Date()
        delta = 0
    }
    
    func start () -> Void {
        date = Date()
    }
    
    func stop () -> Void {
        delta -= date.timeIntervalSinceNow
    }
    
    func reset () -> Void {
        delta = 0
    }
    
    func getTimeString () -> String {
        let interval = -date.timeIntervalSinceNow + delta
        let mins : Int = Int(interval) / 60
        let secs : Int = Int(interval) % 60
        let ms : Int = Int(interval * 100) % 100
        return String(format: "%02d:%02d.%02d", mins, secs, ms)
    }
    
}
