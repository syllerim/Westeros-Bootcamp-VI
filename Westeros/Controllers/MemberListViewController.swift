//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 19/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Properties
    var model: [Person]
    
    // MARK:- Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
        
        subscribeToNotifications()
    }
    
    deinit {
        unSubscribeToNotifications()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asignamos la fuente de datos
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK:- Notifications
    func subscribeToNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    func unSubscribeToNotifications(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func houseDidChange(notification: Notification) {
        // Extraer el userInfo de la notification
        guard let info = notification.userInfo else { return }
        
        // Sacar la casa del userInfo
        if let house = info[HOUSE_KEY] as? House {
            model = house.sortedMembers
            tableView.reloadData()
        }
    }
}

// MARK:- DataSource
extension MemberListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        // Devolver la celda
        return cell
    }
}

// MARK:- Delegate
extension MemberListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = model[indexPath.row]
        let memberDetailsViewController = MemberDetailsViewController(model: member)
        navigationController?.pushViewController(memberDetailsViewController, animated: true)
    }
}
