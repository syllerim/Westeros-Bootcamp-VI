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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncWithModel()
    }
    
    // Mark: - Sync
    func syncWithModel(){
        episodeTitleLabel.text = model.title
        episodeBroadcastDateLabel.text = model.broadcastDate.toString
        episodeSummaryTextView.text = model.summary
    }

}
