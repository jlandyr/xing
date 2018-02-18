//
//  CoreData.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class CoreData:NSObject{
    
    static func save(repositories: Repositories){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        for i in 0..<repositories.count(){
            let entity = NSEntityDescription.entity(forEntityName: "Repo", in: managedContext)
            let task = NSManagedObject(entity: entity!, insertInto: managedContext)
            let repo = repositories.get(index: i)
            task.setValue(repo.description, forKey: "descriptionRepo")
            task.setValue(repo.fork, forKey: "fork")
            task.setValue(repo.loginOwner, forKey: "loginOwner")
            task.setValue(repo.repositoryName, forKey: "name")
        }
        do {
            try managedContext.save()
            print("Repos - successfully saved")
        } catch let error as NSError {
            print("Imposible to save \(error.localizedDescription), \(error.userInfo)")
        }
    }
    
    
    static func deleteRepos(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let arrayEntity = ["Repo"]
        for entity in arrayEntity{
            
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                print ("Repo deleted!")
                try context.execute(deleteRequest)
                try context.save()
            } catch {
                print ("There was an error: \(error.localizedDescription)")
            }
        }
    }
    
    
    static func readRepos() -> Repositories?{
        var tasks = [NSManagedObject]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Repo")
        do {
            let results = try managedContext.fetch(fetchRequest)
            tasks = results as! [NSManagedObject]
            return coreDataToRepositories(managedObjects: tasks)
        } catch let error as NSError {
            print("Imposible to load data \(error.localizedDescription), \(error.userInfo)")
            return nil
        }
        
    }
}
