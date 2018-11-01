//
//  CoreDataStack.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Worldbuilder Tool")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load from persistent store: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    } ()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
