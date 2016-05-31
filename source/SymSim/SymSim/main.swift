//
//  main.swift
//  SymSim
//
//  Created by Russ Bishop on 5/31/16.
//  Copyright © 2016 Russ Bishop. All rights reserved.
//

import Foundation

var standardError = NSFileHandle.fileHandleWithStandardError()

let cli = CommandLine()

cli.formatOutput = { s, type in
    var str: String
    switch type {
    case .Error:
        str = s.red.bold
    case .OptionFlag:
        str = s.green
    case .OptionHelp:
        str = s.cyan
    default:
        str = s
    }
    return cli.defaultFormat(str, type: type)
}

let printDevices = BoolOption(shortFlag: "p", longFlag: "print", helpMessage: "Print the list of available devices")
let coreSimDirectory = StringOption(longFlag: "simdir", helpMessage: "CoreSimulator device directory. Defaults to '~/Library/Developer/CoreSimulator/Devices/'")
let createLinks = BoolOption(shortFlag: "c", longFlag: "create", helpMessage: "Create links to the available devices or update existing links")
let linkDirectory = StringOption(shortFlag: "o", longFlag: "outdir", helpMessage: "Output directory to place links in. Defaults to '.'")
let noColors = BoolOption(longFlag: "nocolor", helpMessage: "Disable colorized output. Defaults to false (colors enabled)")

let deviceTypeFilter = EnumOption<DeviceType>(longFlag: "type", helpMessage: "Filter to only device type (One of: iPad, iPhone, tv, watch)")
let osFilter = EnumOption<OperatingSystem>(longFlag: "os", helpMessage: "Filter to only operating system (One of: iOS, tvOS, watchOS)")
let majorVerFilter = IntOption(longFlag: "major", helpMessage: "Filter to only operating system major version (eg: 9 for iOS 9.x)")
let minorVerFilter = IntOption(longFlag: "minor", helpMessage: "Filter to only operating system minor version (eg: 1 for iOS x.1)")

cli.addOptions(printDevices, createLinks, linkDirectory, coreSimDirectory, noColors, deviceTypeFilter, osFilter, majorVerFilter, minorVerFilter)

do {
    print("\("SymSim".bold.yellow)\nCreate symlinks to CoreSimulator devices for easier navigation")
    print("Created by Russ Bishop, http://russbishop.net")
    print("MIT Licensed; you may modify and redistribute freely. NO WARRANTY.\n\n")
    try cli.parse()
    if noColors.value {
        Rainbow.enabled = false
    }
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

extension NSFileHandle: OutputStreamType {
    public func write(string: String) {
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true) {
            self.writeData(data)
        }
    }
}

do {
    let defaultPath = NSString(string: "~/Library/Developer/CoreSimulator/Devices").stringByStandardizingPath
    let devicesPath = coreSimDirectory.value.flatMap { NSURL(fileURLWithPath: NSString(string: $0).stringByStandardizingPath) } ?? NSURL(fileURLWithPath: defaultPath)

    var devices = try readDevices(devicesPath.URLByAppendingPathComponent("device_set.plist"))
    if let type = deviceTypeFilter.value {
        devices = devices.filter { $0.type == type }
    }
    if let os = osFilter.value {
        devices = devices.filter { $0.os == os }
    }
    if let major = majorVerFilter.value {
        devices = devices.filter { $0.version.major == major }
    }
    if let minor = minorVerFilter.value {
        devices = devices.filter { $0.version.minor == minor }
    }

    if createLinks.value {
        try createLinks(linkDirectory.value ?? ".", deviceDirectory: devicesPath, devices: devices)
    } else if printDevices.value {
        printDevices(devices)
    } else {
        cli.printUsage()
    }
} catch {
    print("Error: \(error)", toStream: &standardError)
}
