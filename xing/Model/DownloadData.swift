//
//  DownloadData.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import Foundation

final class DownloadData{
    
    static let sharedInstance = DownloadData()
    
    func with(URL stringURL: url, onSuccess: @escaping (Repositories) -> Void, onError: ((Error) -> Void)?) {
        let session = URLSession.shared
        if let url = URL(string: stringURL.rawValue){
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                OperationQueue.main.addOperation {
                    if error != nil{
                        print(error?.localizedDescription ?? "error DownloadData: \(stringURL.rawValue)")
                    }else{
                        onSuccess(parseRepository(data: data!))
                    }
                }
            })
            task.resume()
        }
    }

}
