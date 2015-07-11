//
//  Multilingual.swift
//  xcmultilingual
//
//  Created by xcmultilingual on 2015-07-11 13:55:55 +0900.
//
//

import Foundation

public struct Multilingual {
    public enum Localizable: String {
        case HELLO = "HELLO"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle.mainBundle()!, value: "\(rawValue)", comment: "")
        }
    }

    public enum Main: String {
        case LIZARD = "LIZARD"
        case DOOR = "DOOR"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Main", bundle: NSBundle.mainBundle()!, value: "\(rawValue)", comment: "")
        }
    }

    public enum SampleLocalizable: String {
        case HELLO = "HELLO"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Localizable", bundle: NSBundle(path: "./DemoApp/sample.bundle"), value: "\(rawValue)", comment: "")
        }
    }

    public enum SampleMain: String {
        case LIZARD = "LIZARD"
        case DOOR = "DOOR"
        case YES = "YES"

        public func string() -> String {
            return NSLocalizedString(rawValue, tableName: "Main", bundle: NSBundle(path: "./DemoApp/sample.bundle"), value: "\(rawValue)", comment: "")
        }
    }

}
