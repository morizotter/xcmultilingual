//
//  Sampler.swift
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

struct Sampler {
    let samples: [Sample]
    init(samples: [Sample]) {
        self.samples = samples
    }

    func print() {
        samples.map { println($0.string()) }
    }

    func printMacros() {
        println("FILE: \(__FILE__)")
        println("LINE: \(__LINE__)")
    }
}
