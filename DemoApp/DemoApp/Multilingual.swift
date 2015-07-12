//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-12 15:59:15 +0900.
//
//

import Foundation

struct Multilingual {
    enum Animal: String {
        case CAT = "CAT"
        case DOG = "DOG"
        case BEAR = "BEAR"
        case DEER = "DEER"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Animal", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    enum Localizable: String {
        case HELLO = "HELLO"
        case GOODMORNING = "GOODMORNING"
        case GOODEVENING = "GOODEVENING"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    enum TUSafariActivity: String {
        case Open in Safari = "Open in Safari"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "TUSafariActivity", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
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
