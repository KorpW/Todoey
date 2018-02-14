//
//  AppDelegate.swift
//  Todoey
//
//  Created by Magnus Eri Wærstad on 12.02.2018.
//  Copyright © 2018 Magnus Eri Wærstad. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
            }
        catch {
            print("Error initialising new reakm, \(error)")
        }
        
        return true
    }


}

