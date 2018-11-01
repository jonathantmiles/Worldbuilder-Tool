//
//  CampaignController.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

class CampaignController {
    
    init() {
        let myFirstNote = Note(name: "My First Note", details: "Detail body text goes here. \n\nUse the top segmented control to set the type of content this note had. \n\nUse the bottom segmented control to set the level of detail this note represents in your campaign.")
        let myFirstCampaign = Campaign(name: "My First Campaign", details: "Replace this with your first campaign, or update it to suit your needs.", campaignType: .none, notes: [myFirstNote])
        self.campaigns = [myFirstCampaign]
        currentCampaign = self.campaigns.first!
    }
    
    // Singleton and currentCampaign management
    
    static let shared = CampaignController()
    
    var currentCampaign: Campaign
    
    public func setCurrentCampaign(campaign: Campaign) {
        currentCampaign = campaign
    }
    
    // Properties
    
    var campaigns: [Campaign]
}
