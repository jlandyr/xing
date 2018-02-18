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
    private (set) lazy var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        loadData((Any).self)
    }

    private func setUpCollectionView(){
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cells")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(loadData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.darkGray
        view.addSubview(collectionView)
    }
    
    @objc private func loadData(_ sender: Any){
        ASProgressHud.showHUDAddedTo(self.view, animated: true, type: .default)
        DownloadData.sharedInstance.with(URL: url.repos, onSuccess: { (repos) in
            self.refreshControl.endRefreshing()
            self.repositories = repos
            self.collectionView.reloadData()
            ASProgressHud.hideHUDForView(self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
