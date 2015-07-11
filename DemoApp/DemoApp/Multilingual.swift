//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-11 17:45:49 +0900.
//
//

import Foundation

struct Multilingual {
    enum Localizable: String {
        case HELLO = "HELLO"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    enum Main: String {
        case LIZARD = "LIZARD"
        case DOOR = "DOOR"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Main", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("/sample.bundle", removeLast: 1), value: "\(rawValue)", comment: "")
        }
    }


    private static func bundle(path: String, removeLast count: Int) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        for i in 0..<count { let n = components.removeLast() }
        let bundlePath = join("/", components) + path
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
