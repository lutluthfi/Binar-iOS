//
//  CoreDataStorage.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 16/05/22.
//

import CoreData

final class CoreDataStorage {
    static let shared = CoreDataStorage()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataStorage")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage unresolved error \(error) with userInfo: \(error.userInfo)")
            }
        }
        return container
    }()
    
    private init() {
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            assertionFailure("CoreDataStorage unresolved error \(error) with userInfo: \((error as NSError).userInfo)")
        }
    }
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
}

extension NSManagedObjectContext {
    func deleteAll<Object>(_ objects: [Object]) where Object: NSManagedObject {
        objects.forEach { delete($0) }
    }
}
