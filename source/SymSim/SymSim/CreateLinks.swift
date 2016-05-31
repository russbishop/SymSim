//
//  CreateLinks.swift
//  SymSim
//
//  Created by Russ Bishop on 5/31/16.
//  Copyright © 2016 Russ Bishop. All rights reserved.
//

import Foundation

func createLinks(destDirectory: String, deviceDirectory: NSURL, devices: [Device]) throws {
    let dest = NSURL(fileURLWithPath: NSString(string: destDirectory).stringByStandardizingPath)
    let fm = NSFileManager.defaultManager()

    for d in devices {
        let osSubDir = dest.URLByAppendingPathComponent(d.os.path)
        let verSubDir = osSubDir.URLByAppendingPathComponent(d.version.path)
        let deviceFile = verSubDir.URLByAppendingPathComponent(d.name)
        let linkTarget = deviceDirectory.URLByAppendingPathComponent(d.uid).URLByAppendingPathComponent("data")

        if !fm.fileExistsAtPath(linkTarget.path!) {
            print("Skipping [\(deviceFile.path!)] because target does not exist (that simulator may not have been booted yet)")
            continue
        }

        print("Creating [\(deviceFile.path!.yellow)] -> [\(linkTarget.path!.cyan)]... ", terminator: "")

        try fm.createDirectoryAtURL(verSubDir, withIntermediateDirectories: true, attributes: nil)
        var isDirectory: ObjCBool = false
        if fm.fileExistsAtPath(deviceFile.path!, isDirectory: &isDirectory) {
            try fm.removeItemAtURL(deviceFile)
        }
        try fm.createSymbolicLinkAtURL(
            deviceFile,
            withDestinationURL: linkTarget
        )
        print("Success!".green)
    }

}

enum CreateLinkError: ErrorType {
    case DestExistsAndIsDirectory
}
