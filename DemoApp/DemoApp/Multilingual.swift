//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-12 16:47:04 +0900.
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

        func keys() -> [String] {
            return ["CAT", "DOG", "BEAR", "DEER"]
        }
    }

    enum Localizable: String {
        case HELLO = "HELLO"
        case GOODMORNING = "GOODMORNING"
        case GOODEVENING = "GOODEVENING"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }

        func keys() -> [String] {
            return ["HELLO", "GOODMORNING", "GOODEVENING"]
        }
    }

    enum Sample2Sample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("Loalizations/sample2.bundle"), value: "\(rawValue)", comment: "")
        }

        func keys() -> [String] {
            return ["SAMPLE"]
        }
    }

    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("sample.bundle"), value: "\(rawValue)", comment: "")
        }

        func keys() -> [String] {
            return ["SAMPLE"]
        }
    }


    private static func bundle(relativePath: String) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        components.removeLast()
        let bundlePath = join("/", components) + "/" + relativePath
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
