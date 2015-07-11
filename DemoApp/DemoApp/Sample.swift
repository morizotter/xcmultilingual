//
//  Sample.swift
//  DemoApp
//
//  Created by MORITANAOKI on 2015/07/11.
//  Copyright (c) 2015年 MORITANAOKI. All rights reserved.
//

import Foundation

struct Sample {
    let desc: String
    let result: String
    init(desc: String, result: String) {
        self.desc = desc
        self.result = result
    }
    func string() -> String {
        return "DESCRIPTION: \(desc)\t RESULT: \(result)"
    }
}