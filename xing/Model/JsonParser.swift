//
//  JsonParser.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation

func parseRepository(data:Data) -> Repositories{
    let arrayRepositories = Repositories()
    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [NSDictionary]
        for item in jsonObject{
            let repo = Repository()
            repo.repositoryName = item["name"] as? String ?? ""
            if let owner = item["owner"] as? NSDictionary{
                repo.loginOwner = owner["login"] as? String ?? ""
            }
            repo.description = item["description"] as? String ?? ""
            if let fork = item["fork"] as? Bool{
                repo.fork = fork
            }
           arrayRepositories.add(repository: repo)
        }
    }catch{
        print("error parsing json \(data.debugDescription)")
    }
    return arrayRepositories
}
