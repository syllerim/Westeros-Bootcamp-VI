//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 15/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let LAST_HOUSE = "LAST_HOUSE"

protocol HouseListViewControllerDelegate: class {
    // should, will, did
    func houseListViewController(_ viewController: HouseListViewController, didSelectHouse: House)
}

class HouseListViewController: UITableViewController {
    
    // MARK:- Properties
    let model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    // MARK:- Initialization
    init(model: [House]) {
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    // MARK:- Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellId = "HouseCell"
        
        // Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincroniza house (model) con cell (vista)
        cell?.imageView?.image = UIImage(named: house.sigil.image)
        cell?.textLabel?.text = house.name.rawValue
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que casa han pulsado
        let house = model[indexPath.row]
        
        // Aviso al delegado
        if UIDevice.current.userInterfaceIdiom == .pad {
            delegate?.houseListViewController(self, didSelectHouse: house)
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            let houseDetailVC = HouseDetailViewController(model: house)
            navigationController?.pushViewController(houseDetailVC, animated: true)
        }
        
        // Mando la misma info a traves de notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY : house])
        notificationCenter.post(notification)
        
        // Guardar las coordenadas (section, row) de la ultima casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
    
    
}

extension HouseListViewController {
    
    func saveLastSelectedHouse(at row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        // Por si las moscas
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // Extraer la row del User Defaults
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        
        // Averiguar la casa de ese row
        let house = model[row]
        
        // Devolverla
        return house
    }
    
    
}
