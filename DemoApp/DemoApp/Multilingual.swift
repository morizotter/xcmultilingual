//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-12 19:40:59 +0900.
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

        static func keys() -> [String] {
            return ["CAT", "DOG", "BEAR", "DEER"]
        }

        static func localizations() -> [String] {
            return Animal.keys().map { Animal(rawValue: $0)!.string() }
        }
    }

    enum Localizable: String {
        case HELLO = "HELLO"
        case GOODMORNING = "GOODMORNING"
        case GOODEVENING = "GOODEVENING"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }

        static func keys() -> [String] {
            return ["HELLO", "GOODMORNING", "GOODEVENING"]
        }

        static func localizations() -> [String] {
            return Localizable.keys().map { Localizable(rawValue: $0)!.string() }
        }
    }

    enum Sample2Sample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("Loalizations/sample2.bundle"), value: "\(rawValue)", comment: "")
        }

        static func keys() -> [String] {
            return ["SAMPLE"]
        }

        static func localizations() -> [String] {
            return Sample2Sample.keys().map { Sample2Sample(rawValue: $0)!.string() }
        }
    }

    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("sample.bundle"), value: "\(rawValue)", comment: "")
        }

        static func keys() -> [String] {
            return ["SAMPLE"]
        }

        static func localizations() -> [String] {
            return SampleSample.keys().map { SampleSample(rawValue: $0)!.string() }
        }
    }


    private static func bundle(relativePath: String) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        components.removeLast()
        let bundlePath = join("/", components) + "/" + relativePath
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
