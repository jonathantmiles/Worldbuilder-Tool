//
//  CampaignDetailViewController.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class CampaignDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        if campaign == nil {
            campaign = CampaignController.shared.currentCampaign
        }
        if let campaign = campaign {
            title = campaign.name
            nameTextField.text = campaign.name
            guard let campaignTypeString = campaign.campaignType,
                let campaignType = CampaignType(rawValue: campaignTypeString) else { return }
            campaignTypeSegmentedControl.selectedSegmentIndex = CampaignType.allCampaignTypes.firstIndex(of: campaignType)!
            detailsTextField.text = campaign.details
        }
        if campaign != CampaignController.shared.currentCampaign {
            setCurrentCampaignButton.isHidden = false
        } else {
            setCurrentCampaignButton.isHidden = true
        }
    }
    
    @IBAction func setCurrentCampaign(_ sender: Any) {
        if let campaign = campaign {
            CampaignController.shared.setCurrentCampaign(campaign: campaign)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Properties
    
    var campaign: Campaign? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var campaignTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var detailsTextField: UITextView!
    @IBOutlet weak var setCurrentCampaignButton: UIButton!
}
