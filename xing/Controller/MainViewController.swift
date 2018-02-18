//
//  MainViewController.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import UIKit
import ASProgressHud

final class MainViewController: UIViewController {

    var collectionView: UICollectionView!
    lazy var repositories :Repositories = Repositories()
    
    lazy var page = 0
    lazy var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        loadData((Any).self)
        navigationItem.title = "XING repository"
    }

    private func setUpCollectionView(){
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cells")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        view.addSubview(collectionView)
    }
    
    @objc func loadData(_ sender: Any){
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .default)
        page += 1
        DownloadData.sharedInstance.with(URL: url.repos, page: page, onSuccess: { (repos) in
            self.isLoading = false
            for item in repos.repositoriesList!{
                self.repositories.add(repository: item)
            }
            self.collectionView.reloadData()
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
