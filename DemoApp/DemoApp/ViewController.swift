//
//  ViewController.swift
//  DemoApp
//
//  Created by MORITANAOKI on 2015/07/11.
//  Copyright (c) 2015年 MORITANAOKI. All rights reserved.
//

import UIKit

struct Table {
    let name: String
    let keys: [String]
    let localizations: [String]
    init(name: String, keys: [String], localizations: [String]) {
        self.name = name
        self.keys = keys
        self.localizations = localizations
    }
}

class ViewController: UITableViewController {
    
    let tables = [
        Table(
            name: "Localizable",
            keys: Multilingual.Localizable.keys(),
            localizations: Multilingual.Localizable.localizations()
        ),
        Table(
            name: "Animal",
            keys: Multilingual.Animal.keys(),
            localizations: Multilingual.Animal.localizations()
        ),
        Table(
            name: "SampleSample",
            keys: Multilingual.SampleSample.keys(),
            localizations: Multilingual.SampleSample.localizations()
        ),
        Table(
            name: "Sample2Sample_Localization",
            keys: Multilingual.Sample2Sample_Localization.keys(),
            localizations: Multilingual.Sample2Sample_Localization.localizations()
        )
    ]
}

// MARK: UITableVIewDataSource
extension ViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tables.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tables[section].keys.count
    }
}

// MARK: UITableViewDelegate
extension ViewController {
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tables[section].name
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let table = tables[indexPath.section]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.textLabel?.text = table.keys[indexPath.row]
        cell.detailTextLabel?.text = table.localizations[indexPath.row]
        return cell
    }
}

