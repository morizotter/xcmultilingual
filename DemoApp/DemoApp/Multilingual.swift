//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-12 14:33:27 +0900.
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

    enum Sample2Sample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("Loalizations/sample2.bundle"), value: "\(rawValue)", comment: "")
        }
    }

    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("sample.bundle"), value: "\(rawValue)", comment: "")
        }
    }


    private static func bundle(relativePath: String) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        components.removeLast()
        let bundlePath = join("/", components) + "/" + relativePath
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
