//
//  Note+Convenience.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

enum NoteType: String {
    case character, item, faction, location, quest, page
    
    static var allNoteTypes: [NoteType] = [character, item, faction, location, quest, page]
}

enum FinishSetting: String {
    case stub, short, draft, polished, finalized
    
    static var allFinishSettings: [FinishSetting] = [stub, short, draft, polished, finalized]
}

extension Note {
    convenience init(name: String, details: String, noteType: NoteType = .page, finishSetting: FinishSetting = .stub, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.details = details
        self.noteType = noteType.rawValue
        self.finishSetting = finishSetting.rawValue
    }
}
