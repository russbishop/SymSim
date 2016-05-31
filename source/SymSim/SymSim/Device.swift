//
//  Devices.swift
//  SymSim
//
//  Created by Russ Bishop on 5/31/16.
//  Copyright © 2016 Russ Bishop. All rights reserved.
//

import Foundation

enum OperatingSystem: String {
    case iOS = "iOS"
    case tvOS = "tvOS"
    case watchOS = "watchOS"

    init?(fromVersionString: String) {
        if fromVersionString.containsString("iOS") {
            self = .iOS
        } else if fromVersionString.containsString("tvOS") {
            self = .tvOS
        } else if fromVersionString.containsString("watchOS") {
            self = .watchOS
        } else {
            return nil
        }
    }

    var path: String {
        return self.rawValue
    }
}

struct OperatingSystemVersion: CustomStringConvertible {
    let major: Int
    let minor: Int
    let revision: Int
    init(fromVersionString: String) {
        let parts = fromVersionString.componentsSeparatedByString("-")
        major = parts[ifExists: 1].flatMap { Int($0) } ?? 0
        minor = parts[ifExists: 2].flatMap { Int($0) } ?? 0
        revision = parts[ifExists: 3].flatMap { Int($0) } ?? 0
    }

    var description: String {
        var parts = [major, minor]
        if revision != 0 { parts.append(revision) }
        return parts.map(String.init).joinWithSeparator(".")
    }

    var path: String {
        var parts = [major, minor]
        if revision != 0 { parts.append(revision) }
        return parts.map(String.init).joinWithSeparator("-")
    }
}

enum DeviceType: String {
    case iPhone = "iPhone"
    case iPad = "iPad"
    case tv = "tv"
    case watch = "watch"

    init?(fromDeviceString s: String, os: OperatingSystem) {
        switch os {
        case .tvOS:
            self = .tv
        case .watchOS:
            self = .watch
        default:
            if s.containsString("iPhone") {
                self = .iPhone
            } else if s.containsString("iPad") {
                self = .iPad
            } else {
                return nil
            }
        }
    }
}

class Device {
    let os: OperatingSystem
    let version: OperatingSystemVersion
    let type: DeviceType

    let name: String
    let uid: String

//    private(set) var pairedDevices: [Device]

    init(uid: String, osString: String, deviceName: String) {
        self.uid = uid
        self.name = deviceName
        self.os = OperatingSystem(fromVersionString: osString)!
        self.type = DeviceType(fromDeviceString: deviceName, os: self.os)!
        self.version = OperatingSystemVersion(fromVersionString: osString)
//        self.pairedDevices = []
    }
}

extension Device: CustomStringConvertible {
    var description: String {
        return "\(name)\t(\(os) \(version))\t[\(uid)]"
    }
}

func readDevices(path: NSURL) throws -> [Device] {
    let data = try NSData(contentsOfURL: path, options: [])
    guard let plist = try NSPropertyListSerialization.propertyListWithData(data, options: .Immutable, format: nil) as? [String:AnyObject] else {
        throw ReadError.NotPlist
    }
    guard let plistVersion = plist["Version"] as? Int where plistVersion == 0 else { throw ReadError.InvalidVersion }
    guard let devices = plist["DefaultDevices"] as? [String:AnyObject] else { throw ReadError.MissingDevicesKey }

    var results: [Device] = []
    for (osKey, osDevices) in devices {
        let osString = osKey.stringByReplacingOccurrencesOfString("com.apple.CoreSimulator.SimRuntime.", withString: "", options: NSStringCompareOptions.CaseInsensitiveSearch)
        guard let osDevices = osDevices as? [String:String] else { continue }
        for (deviceName, deviceUid) in osDevices {
            let deviceName = deviceName.stringByReplacingOccurrencesOfString("com.apple.CoreSimulator.SimDeviceType.", withString: "")
            results.append(Device(uid: deviceUid, osString: osString, deviceName: deviceName))
        }
    }

//    if let pairs = plist["DevicePairs"] as? [String:[String:AnyObject]] {
//        for (pairUid, pairDict) in pairs {
//
//        }
//    }

    return results
}


enum ReadError: ErrorType {
    case NotPlist
    case InvalidVersion
    case MissingDevicesKey
}