//
//  AppDelegate.swift
//  DemoApp
//
//  Created by MORITANAOKI on 2015/07/11.
//  Copyright (c) 2015年 MORITANAOKI. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSBundle(path: "")
        println(Multilingual.Localizable.HELLO.string())
        Multilingual.Localizable.HELLO.string()
        
        let yes = Multilingual.SampleMain.YES.string()
        println("yes: \(yes)")
        
        let all = NSBundle.allBundles()
        for b in all {
            b.load()
            println("b: \(b)")
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "bundle:", userInfo: b, repeats: true)
        }
        
        let bundle = NSBundle(path: "/Users/moritanaoki/repositories/bitbucket/xcmultilingual/tmp/multilingual-test/multilingual-test/sample.bundle")
        bundle?.load()
        println("bundle: \(bundle)")
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "bundle:", userInfo: bundle!, repeats: true)
        
        let bundleString = NSLocalizedString("Door", tableName: "Main", bundle: bundle!, value: "", comment: "")
        println("bundle string: \(bundleString)")
        
        return true
    }
    
    func bundle(timer: NSTimer) {
        let bundle = timer.userInfo as! NSBundle
        println("bundle: \(bundle)")
        let bundleString = NSLocalizedString("LIZARD", tableName: "Main", bundle: bundle, value: "", comment: "")
        println("bundle string: \(bundleString)")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

