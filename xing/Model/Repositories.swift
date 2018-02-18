//
//  Repositories.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation

public protocol RepositoriesProtocol{
    func count() -> Int
    func add(repository:Repository)
    func get(index: Int) -> Repository
}

class Repositories:RepositoriesProtocol{
    var repositoriesList: [Repository]?
    
    public init() {
        self.repositoriesList = []
    }
    public func count() -> Int {
        return repositoriesList?.count ?? 0
    }
    
    public func add(repository: Repository) {
        repositoriesList?.append(repository)
    }
    
    public func get(index: Int) -> Repository {
        return repositoriesList![index]
    }
    
    
}
