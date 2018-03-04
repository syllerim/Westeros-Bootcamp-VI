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
        tabBarController.delegate = self
        
        tabBarSelected = houseListViewController.title!
        
        // Controladores para detailsVC
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        houseListViewController.delegate = houseDetailViewController
        
        let lastSelectedSeason = seasonListViewController.lastSelectedSeason()
        seasonDetailViewController = SeasonDetailViewController(model: lastSelectedSeason)
        seasonListViewController.delegate = seasonDetailViewController
        
        // Crear el UISplitVC y le asignamos los viewControllers (master y detail)
        splitViewController.preferredDisplayMode = .allVisible
        splitViewController.viewControllers = [ tabBarController, houseDetailViewController.wrappedInNavigation() ]
        
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
            
            switch viewController.title! {
            case "Seasons":
                if UIDevice.current.userInterfaceIdiom == .pad {
                    splitViewController.showDetailViewController(seasonDetailViewController.wrappedInNavigation(), sender: self)
                }
            default:
                if UIDevice.current.userInterfaceIdiom == .pad {
                    splitViewController.showDetailViewController(houseDetailViewController.wrappedInNavigation(), sender: self)
                }
            }
        }
    }
    
}
