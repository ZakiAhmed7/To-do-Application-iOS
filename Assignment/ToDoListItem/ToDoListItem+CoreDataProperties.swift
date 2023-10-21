//
//  ToDoListItem+CoreDataProperties.swift
//  Assignment
//
//  Created by user235324 on 10/13/23.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?

}

extension ToDoListItem : Identifiable {
    
    }

func saveData() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context : NSManagedObjectContext = appDelegate.userActivity?.persistentIdentifier.
    
}
