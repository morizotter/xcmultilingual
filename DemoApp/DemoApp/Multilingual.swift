//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-11 14:27:11 +0900.
//
//

import Foundation

public struct Multilingual {
    public enum Localizable: String {
        case HELLO = "HELLO"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    public enum Main: String {
        case LIZARD = "LIZARD"
        case DOOR = "DOOR"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Main", bundle: NSBundle.mainBundle(), value: "\(rawValue)", comment: "")
        }
    }

    public enum SampleSample: String {
        case SAMPLE = "SAMPLE"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Sample", bundle: NSBundle(path: "/Users/moritanaoki/repositories/bitbucket/xcmultilingual/DemoApp/DemoApp/sample.bundle")!, value: "\(rawValue)", comment: "")
        }
    }

}
