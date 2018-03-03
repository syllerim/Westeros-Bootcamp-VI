//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //MARK:- Properties
    var tabBarSelected = ""
    
    var houseDetailViewController: HouseDetailViewController!
    var seasonDetailViewController: SeasonDetailViewController!
    
    let splitViewController = UISplitViewController()
    
    
    //MARK:- AppDelegate Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        // Crear los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Controladores para masterVC
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [houseListViewController.wrappedInNavigation(), seasonListViewController.wrappedInNavigation()]
        tabBarSelected = houseListViewController.title!
        
        // Controladores para detailsVC
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        houseListViewController.delegate = houseDetailViewController
        
        let lastSelectedSeason = seasonListViewController.lastSelectedSeason()
        seasonDetailViewController = SeasonDetailViewController(model: lastSelectedSeason)
        seasonListViewController.delegate = seasonDetailViewController
        
        // Crear el UISplitVC y le asignamos los viewControllers (master y detail)
        splitViewController.viewControllers = [ tabBarController, houseDetailViewController.wrappedInNavigation() ]
        
        tabBarController.delegate = self
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        UINavigationBar.appearance().backgroundColor = .blue
        
        return true
    }
    
    
}

extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController.title != tabBarSelected {
            tabBarSelected = viewController.title!
            splitViewController.viewControllers.removeLast()
           
            switch viewController.title! {
            case "Seasons":
                splitViewController.viewControllers.append(seasonDetailViewController)
            default:
                splitViewController.viewControllers.append(houseDetailViewController)
            }
        }
    }
    
    
}
