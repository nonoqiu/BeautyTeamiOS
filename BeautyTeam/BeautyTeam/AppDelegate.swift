//
//  AppDelegate.swift
//  BeautyTeam
//
//  Created by 李昂 on 3/29/16.
//  Copyright © 2016 Shenyang Obisoft Technology Co.Ltd. All rights reserved.
//

import UIKit
import CoreData
import KeychainSwift

import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?
    var loginVC: ObiLoginVC?
    
    var noticeVC: NoticeVC?
    var teamVC: TeamVC?
    var mainVC: MainVC?
    
    var tabBarController: UITabBarController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Debug
//        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        self.loginVC = ObiLoginVC(style: .Grouped)
//        self.window?.rootViewController = UINavigationController(rootViewController: loginVC!)
//        self.window?.makeKeyAndVisible()
        
        // Load tabs
        self.noticeVC = NoticeVC(style: .Grouped)
        self.teamVC = TeamVC(style: .Grouped)
        self.mainVC = MainVC(style: .Grouped)
        
        let noticeNC = UINavigationController(rootViewController: noticeVC!)
        let teamNC = UINavigationController(rootViewController: teamVC!)
        let mainNC = UINavigationController(rootViewController: mainVC!)
        
        // Debugging
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        teamNC.navigationController?.navigationBar.barTintColor = UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1)
        self.window?.rootViewController = teamNC
        self.window?.makeKeyAndVisible()
        return true
        
//        let tabBarController = UITabBarController()
        self.tabBarController = UITabBarController()
        
        guard let noticeLogo = UIImage(named: "NoticeLogo") else {
            fatalError("Notice logo not found")
        }
        guard let teamLogo = UIImage(named: "TeamLogo") else {
            fatalError("Team logo not found")
        }
        guard let mainLogo = UIImage(named: "MainLogo") else {
            fatalError("Main logo not found")
        }
        
        guard let noticeLogo_sel = UIImage(named: "NoticeLogo-selected") else {
            fatalError("Notice logo selected not found")
        }
        guard let teamLogo_sel = UIImage(named: "TeamLogo-selected") else {
            fatalError("Team logo selected not found")
        }
        guard let mainLogo_sel = UIImage(named: "MainLogo-selected") else {
            fatalError("Main logo selected not found")
        }
        
        let noticeVCTabBarItem = UITabBarItem(title: "Notice", image: noticeLogo, selectedImage: noticeLogo_sel)
        let teamVCTabBarItem = UITabBarItem(title: "Team", image: teamLogo, selectedImage: teamLogo_sel)
        let mainVCTabBarItem = UITabBarItem(title: "Main", image: mainLogo, selectedImage: mainLogo_sel)
        // TODO: 改变字体选中颜色
        
        noticeVC!.tabBarItem = UITabBarItem(tabBarSystemItem: .Bookmarks, tag: 0)
        teamVC!.tabBarItem = UITabBarItem(tabBarSystemItem: .Contacts, tag: 1)
        mainVC!.tabBarItem = UITabBarItem(tabBarSystemItem: .Downloads, tag: 2)
        
//        tabBarController!.viewControllers = [UIViewController]()
//        tabBarController!.viewControllers?.append(noticeNC)
//        tabBarController!.viewControllers?.append(teamNC)
//        tabBarController!.viewControllers?.append(mainNC)
        
        tabBarController?.addChildViewController(noticeNC)
        tabBarController?.addChildViewController(teamNC)
        tabBarController?.addChildViewController(mainNC)
        
        self.tabBarController?.delegate = self
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = tabBarController
//        self.window?.addSubview(tabBarController!.view)
        self.window?.makeKeyAndVisible()
        
        // Add login listener
        
        return true
    }
    
    func silentCheckSignIn() {
        Alamofire.request(.GET, ObiBeautyTeam.APIURL + "/loginstsatus")
            .responseJSON {
            resp in
            
            guard let rawData = resp.result.value as? Dictionary<String, AnyObject?> else {
                return
            }
            let loginStatus = ObiValue<Bool>(rawData: rawData)
            if loginStatus.statusCode != 200 {
                return
            }
            if !loginStatus.value {
                NSNotificationCenter.defaultCenter().postNotificationName("", object: nil)
            }
        }
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.obisoft.BeautyTeam" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("BeautyTeam", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

