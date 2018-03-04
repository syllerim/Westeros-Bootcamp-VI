//
//  EpisodeDetailsViewController.swift
//  Westeros
//
//  Created by Mirellys on 03/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailsViewController: UIViewController {

    @IBOutlet var episodeTitleLabel: UILabel!
    @IBOutlet var episodeBroadcastDateLabel: UILabel!
    @IBOutlet var episodeSummaryTextView: UITextView!
    
    var model: Episode
    
    init(model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Episode Details"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.title = "Episode Details"
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange),
                                       name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
        syncWithModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo else {
            return
        }
        
        if info[SEASON_KEY] as? Season != nil {
            navigationController?.popViewController(animated: true)
        }
    }
    
    // Mark: - Sync
    func syncWithModel(){
        episodeTitleLabel.text = model.title
        episodeBroadcastDateLabel.text = model.broadcastDate.toString
        episodeSummaryTextView.text = model.summary
    }
    
}
