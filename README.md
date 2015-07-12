# xcmultilingual

Command line tool for Swift localizations: It parses localization files in the project and output swift file including functions with pretty complementations!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xcmultilingual'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xcmultilingual

## Usage

### 1. Install xcmultilingual instructed above.

This is command line tool distributed with [RubyGems.org](https://rubygems.org/).

### 2. Create empty swift file in top level of project tree.

Named as `Multilingual.swift` in this example. **xcmultilingual** parses same and lower directries' .bundle and .lproj.

```
.
├── DemoApp
│   ├── AppDelegate.swift
│   ├── Base.lproj
│   ├── Images.xcassets
│   ├── Info.plist
│   ├── Loalizations
│   ├── Multilingual.swift
```

### 3. Execute update command with destination file path

```
$ xcmultingual update ./DemoApp/Multilingual.swift
```

And then convenient functions will be generated in destination swift file.

Example:

```
import Foundation

struct Multilingual {
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

    private static func bundle(relativePath: String) -> NSBundle {
        var components = (__FILE__ as String).pathComponents
        components.removeLast()
        let bundlePath = join("/", components) + "/" + relativePath
        return NSBundle(path: bundlePath) ?? NSBundle.mainBundle()
    }
}
```

### 4. Use with complementations!!

And now, you can access your localization string with pretty good complementations.

For example, when write: Multilingual, complementations are below:

```
Multilingual.Localizable
Multilingual.Animal
```

And then, select `Multilingual.Animan`, complementations are blow:

```
Multilingual.Animal.CAT
Multilingual.Animal.DOG
Multilingual.Animal.BEAR
Multilingual.Animal.DEER
```

Awesome!

And print localized string is:

```
Multilingual.Animal.DOG.string()
```

Easy!

## Commands

**update:** Update swift file. DESTINATION is required.

options:
- `-name` or `-n`: Change Localization struct name. Default is Multilingual.
- `--verbose`: Output execution logs

**help:** Write `update` after help and show update options' help.

If you want to use `LOC` for top level struct name. `xcmultilingual update ./DemoApp/Multilingual.swift -n LOC` and then you can write like `LOC.Animal.DOG.string()`

## Swift functions

`Multilingual` is swift struct. Localization files tables are represented as enum in this struct.

Each struct has `Table name` and `string()` instance function and `keys()` and `localizations()` static functions.

Example:

When you want to use Animal table's DOG key localization.

```
Multilingual.Animal.DOG.string() // Dog
```

When you want to show every localizations in test.

```
Multilingual.Animal.localizations() // ["Cat", "Dog", "Bear", "Dear"]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/morizotter/xcmultilingual. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
