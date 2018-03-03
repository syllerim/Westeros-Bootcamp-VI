//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Mirellys on 03/03/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet var seasonNameLabel: UILabel!
    @IBOutlet var seasonDateReleaseLabel: UILabel!
    @IBOutlet var seasonCoverImageView: UIImageView!
    @IBOutlet var seasonSummaryLabel: UITextView!
    
    //MARK:- Properties
    var model: Season
    
    //MARK:- Initialization
    init(model: Season) {
        self.model = model
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncModelWithView()
    }
    
    func syncModelWithView() {
        seasonNameLabel.text = model.name
        seasonDateReleaseLabel.text = model.dateRelease.toString
        seasonCoverImageView.image = model.image
        seasonCoverImageView.contentMode = .scaleAspectFit
        seasonSummaryLabel.text = model.summary
        
    }
    
    @IBAction func seeListEpisodesButton(_ sender: Any) {
        
    }
    
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason season: Season) {
        model = season
        syncModelWithView()
    }
    
}
