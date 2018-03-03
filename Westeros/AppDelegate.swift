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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        // Crear los modelo
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Creamos los controladores (masterVC, detailVC) para houses y seasons
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        // Buscamos los ultimos seleccionados
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        
        // Creamos los VC Detail
        let houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        let seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        // Asignar delegados
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        
        // Crear el UISplitVC y le asignamos los viewControllers (master y detail)
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
            houseListViewController.wrappedInNavigation(), houseDetailViewController.wrappedInNavigation()
        ]
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        UINavigationBar.appearance().backgroundColor = .blue
        
        return true
    }

    
}

