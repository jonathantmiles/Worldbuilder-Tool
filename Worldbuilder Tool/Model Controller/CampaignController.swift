//
//  CampaignController.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

class CampaignController {
    
    init() {
        let myFirstNote = Note(name: "My First Note", details: "Detail body text goes here. \n\nUse the top segmented control to set the type of content this note had. \n\nUse the bottom segmented control to set the level of detail this note represents in your campaign.")
        let myFirstCampaign = Campaign(name: "My First Campaign", details: "Replace this with your first campaign, or update it to suit your needs.", campaignType: .none, notes: [myFirstNote])
        // self.campaigns = [myFirstCampaign]
        currentCampaign = myFirstCampaign
    }
    
    // Singleton and currentCampaign management
    
    static let shared = CampaignController()
    
    var currentCampaign: Campaign
    
    public func setCurrentCampaign(campaign: Campaign) {
        currentCampaign = campaign
    }
    
    // MARK: - Campaign methods
    
    func createNewCampaign(withName name: String, details: String, campaignType: CampaignType) {
        let _ = Campaign(name: name, details: details, campaignType: campaignType, notes: [])
        saveToPersistentStore()
    }
    
    func update(campaign: Campaign, withName name: String, details: String, campaignType: CampaignType) {
        campaign.name = name
        campaign.details = details
        campaign.campaignType = campaignType.rawValue
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.shared.mainContext
        moc.perform {
            do {
                try moc.save()
            } catch {
                moc.reset()
                NSLog("Error saving managed object context: \(error)")
            }
        }
    }
    
    func loadFromPersistentStore() -> [Campaign] {
        let fetchRequest: NSFetchRequest<Campaign> = Campaign.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching campaigns: \(error)")
            return []
        }
    }
    
    // Properties
    
    var campaigns: [Campaign] {
        return loadFromPersistentStore()
    }
}
