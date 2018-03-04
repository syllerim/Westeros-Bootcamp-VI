//
//  EpisodeDetailsViewController.swift
//  Westeros
//
//  Created by Mirellys on 03/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    // MARK:- Outlets
    @IBOutlet var episodeTitleLabel: UILabel!
    @IBOutlet var episodeBroadcastDateLabel: UILabel!
    @IBOutlet var episodeSummaryTextView: UITextView!
    
    // MARK:- Properties
    var model: Episode
    
    // MARK:- Initialization
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Episode Details"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- VC Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        subscribeForNotifications()
        syncWithModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unSubscribeForNotifications()
    }
    
    // MARK:- Notifications
    func subscribeForNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange),
                                       name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
    }
    
    func unSubscribeForNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo else { return }
        guard info[SEASON_KEY] as? Season != nil else { return }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:- Sync
    func syncWithModel(){
        episodeTitleLabel.text = model.title
        episodeBroadcastDateLabel.text = model.broadcastDate.toString
        episodeSummaryTextView.text = model.summary
    }
    
    
}
