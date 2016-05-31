//
//  PrintDevices.swift
//  SymSim
//
//  Created by Russ Bishop on 5/31/16.
//  Copyright © 2016 Russ Bishop. All rights reserved.
//

import Foundation

func printDevices(devices: [Device]) {
    for d in devices {
        print("\(d.name.cyan)", terminator: "")
        if d.name.characters.count <= 6 {
            print("\t", terminator: "")
        }
        if d.name.characters.count < 16 {
            print("\t", terminator: "")
        }
        print("\t(\(String(d.os).green) \(d.version.description.yellow))\t[\(d.uid.lightMagenta)]")
    }
}
