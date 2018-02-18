//
//  CoreDataParser.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation
import CoreData

func coreDataToRepositories(managedObjects:[NSManagedObject]) -> Repositories{
    let array = Repositories()
    for item in managedObjects{
        let repo = Repository()
        repo.description = item.value(forKey: "descriptionRepo") as? String ?? ""
        repo.fork = item.value(forKey: "fork") as? Bool ?? false
        repo.loginOwner = item.value(forKey: "loginOwner") as? String ?? ""
        repo.repositoryName = item.value(forKey: "name") as? String ?? ""
        array.add(repository: repo)
    }
    return array
}
