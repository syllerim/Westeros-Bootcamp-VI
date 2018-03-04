//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Mirellys on 03/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet var tableView: UITableView!
    
    //MARK:- Properties
    var model: [Episode]
    
    // MARK: - Initialization
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
        
        subscribeToNotificationCenter()
    }
    
    deinit {
        unSubscribeToNotificationCenter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Notifications
    func subscribeToNotificationCenter() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange),
                                       name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME),
                                       object: nil)
    }
    
    func unSubscribeToNotificationCenter() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo else { return }
        
        if let season = info[SEASON_KEY] as? Season {
            model = Array(season.episodes)
            tableView.reloadData()
        }
    }
}

// MARK:- DataSource
extension EpisodeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        let episode = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
}

// MARK:- Delegate
extension EpisodeListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailsViewController = EpisodeDetailsViewController(model: episode)
        navigationController?.pushViewController(episodeDetailsViewController, animated: true)
    }
    
    
}
