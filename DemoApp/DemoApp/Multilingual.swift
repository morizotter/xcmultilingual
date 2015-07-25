//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual.
//
//

import Foundation

struct Multilingual {

    class Multilingual51266C848DD847B59BE2F1B44CBF9ABA {}

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

        var value: String {
            return NSLocalizedString(rawValue, tableName: Animal.name, bundle: NSBundle(forClass: Multilingual51266C848DD847B59BE2F1B44CBF9ABA.self), value: rawValue, comment: "")
        }

        static let name = "Animal"

        static var keys: [String] {
            return ["CAT", "DOG", "BEAR", "DEER", "SQUIRREL", "ELEPHANT", "GIRAFFE", "TIGER", "LION", "RABBIT", "RHINOCEROS", "GORILLA", "MONKEY"]
        }

        static var localizations: [String] {
            return Animal.keys.map { Animal(rawValue: $0)!.value }
        }
    }

    enum Localizable: String {
        case HELLO = "HELLO"
        case GOODMORNING = "GOODMORNING"
        case GOODEVENING = "GOODEVENING"

        var value: String {
            return NSLocalizedString(rawValue, tableName: Localizable.name, bundle: NSBundle(forClass: Multilingual51266C848DD847B59BE2F1B44CBF9ABA.self), value: rawValue, comment: "")
        }

        static let name = "Localizable"

        static var keys: [String] {
            return ["HELLO", "GOODMORNING", "GOODEVENING"]
        }

        static var localizations: [String] {
            return Localizable.keys.map { Localizable(rawValue: $0)!.value }
        }
    }


    enum Sample2Sample_Localization: String {
        case SAMPLE_2 = "SAMPLE 2"

        var value: String {
            return NSLocalizedString(rawValue, tableName: Sample2Sample_Localization.name, bundle: NSBundle(path: NSBundle(forClass: Multilingual.Multilingual51266C848DD847B59BE2F1B44CBF9ABA.self).resourcePath!.stringByAppendingPathComponent("sample2.bundle"))!, value: rawValue, comment: "")
        }

        static let name = "Sample Localization"

        static var keys: [String] {
            return ["SAMPLE 2"]
        }

        static var localizations: [String] {
            return Sample2Sample_Localization.keys.map { Sample2Sample_Localization(rawValue: $0)!.value }
        }
    }


    enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        var value: String {
            return NSLocalizedString(rawValue, tableName: SampleSample.name, bundle: NSBundle(path: NSBundle(forClass: Multilingual.Multilingual51266C848DD847B59BE2F1B44CBF9ABA.self).resourcePath!.stringByAppendingPathComponent("sample.bundle"))!, value: rawValue, comment: "")
        }

        static let name = "Sample"

        static var keys: [String] {
            return ["SAMPLE"]
        }

        static var localizations: [String] {
            return SampleSample.keys.map { SampleSample(rawValue: $0)!.value }
        }
    }

}
