//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Mirellys on 04/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberDetailsViewController: UIViewController {

    @IBOutlet var personName: UILabel!
    @IBOutlet var personImageView: UIImageView!
    
    //MARK:- Properties
    var model: Person
    
    //MARK:- Initialization
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Member Details"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        subscribeToNotifications()
        syncModelWithView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unSubscribeToNotifications()
    }
    
    // MARK:- Sync
    func syncModelWithView() {
        personName.text = model.name
        personImageView.image = UIImage(named: model.house.sigil.image)
    }
    
    //MARK:- Notifications
    func subscribeToNotifications(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange),
                                       name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
    }

    func unSubscribeToNotifications(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }

    @objc func houseDidChange(notification: Notification) {
        guard let info = notification.userInfo else { return }
        guard info[HOUSE_KEY] as? House != nil else { return }
        navigationController?.popViewController(animated: true)
    }
}
