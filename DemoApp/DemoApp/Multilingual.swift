//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual.
//
//

import Foundation

struct Multilingual {
    enum Animal: String {
        case CAT = "CAT"
        case DOG = "DOG"
        case BEAR = "BEAR"
        case DEER = "DEER"
        case SQUIRREL = "SQUIRREL"
        case ELEPHANT = "ELEPHANT"
        case GIRAFFE = "GIRAFFE"
        case TIGER = "TIGER"
        case LION = "LION"
        case RABBIT = "RABBIT"
        case RHINOCEROS = "RHINOCEROS"
        case GORILLA = "GORILLA"
        case MONKEY = "MONKEY"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Animal", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }

        static var title = "Animal"

        static var keys: [String] {
            return ["CAT", "DOG", "BEAR", "DEER", "SQUIRREL", "ELEPHANT", "GIRAFFE", "TIGER", "LION", "RABBIT", "RHINOCEROS", "GORILLA", "MONKEY"]
        }
        static var localizations: [String] {
            return Animal.keys.map { Animal(rawValue: $0)!.string() }
        }
    }

    enum Localizable: String {
        case HELLO = "HELLO"
        case GOODMORNING = "GOODMORNING"
        case GOODEVENING = "GOODEVENING"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }

        static var title = "Localizable"

        static var keys: [String] {
            return ["HELLO", "GOODMORNING", "GOODEVENING"]
        }
        static var localizations: [String] {
            return Localizable.keys.map { Localizable(rawValue: $0)!.string() }
        }
    }

    enum Sample2Sample_Localization: String {
        case SAMPLE_2 = "SAMPLE 2"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample Localization", bundle: Multilingual.bundle("Loalizations/sample2.bundle"), value: "\(rawValue)", comment: "")
        }

        static var title = "Sample Localization"

        static var keys: [String] {
            return ["SAMPLE 2"]
        }
        static var localizations: [String] {
            return Sample2Sample_Localization.keys.map { Sample2Sample_Localization(rawValue: $0)!.string() }
        }
    }

    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: Multilingual.bundle("sample.bundle"), value: "\(rawValue)", comment: "")
        }

        static var title = "Sample"

        static var keys: [String] {
            return ["SAMPLE"]
        }
        static var localizations: [String] {
            return SampleSample.keys.map { SampleSample(rawValue: $0)!.string() }
        }
    }


    private static func bundle(relativePath: String) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        components.removeLast()
        let bundlePath = join("/", components) + "/" + relativePath
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
