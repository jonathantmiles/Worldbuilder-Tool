//
//  Campaign+Convenience.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

enum CampaignType: String {
    case dnd5e, pathfinder, adventureWorld, bladesInTheDark, fiasco, none
    
    static var allCampaignTypes: [CampaignType] = [dnd5e, pathfinder, adventureWorld, bladesInTheDark, fiasco, none]
}

extension Campaign {
    
    convenience init(name: String, details: String, campaignType: CampaignType, notes: [Note], context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.details = details
        self.campaignType = campaignType.rawValue
        let set = NSOrderedSet(array: notes)
        self.notes = set
    }
}
