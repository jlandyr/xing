//
//  MainCollectionViewCell.swift
//  xing
//
//  Created by Juan Landy on 18/2/18.
//  Copyright © 2018 Juan Landy. All rights reserved.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    let labelRepositoryName = UILabel()
    let labelDescription = UILabel()
    let labelLoginOwner = UILabel()
    let viewBackground = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var repo: Repository?{
        didSet{
            guard let repository = repo else {return}
            labelRepositoryName.text = "Name: \(repository.repositoryName)"
            labelLoginOwner.text = "Owner: \(repository.loginOwner)"
            labelDescription.text = "Description: \(repository.description)"
            if !repository.fork{
                viewBackground.backgroundColor = UIColor.white
            }else{
                viewBackground.backgroundColor = UIColor(red: 142/255, green: 250/255, blue: 0, alpha: 1)
            }
        }
    }
    
    func addViews(){
        addSubview(viewBackground)
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        viewBackground.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        viewBackground.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        labelRepositoryName.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        labelLoginOwner.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: [labelRepositoryName, labelDescription, labelLoginOwner])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        labelRepositoryName.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        labelRepositoryName.bottomAnchor.constraint(equalTo: labelDescription.topAnchor, constant: 0).isActive = true
        labelRepositoryName.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 0).isActive = true
        labelRepositoryName.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        labelDescription.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        labelDescription.bottomAnchor.constraint(equalTo: labelLoginOwner.topAnchor, constant: 0).isActive = true
        labelDescription.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 0).isActive = true
        labelDescription.topAnchor.constraint(equalTo: labelRepositoryName.bottomAnchor, constant: 0).isActive = true
        labelLoginOwner.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 0).isActive = true
        labelLoginOwner.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
        labelLoginOwner.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 0).isActive = true
        labelLoginOwner.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 0).isActive = true
        
        self.addSubview(stackView)
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
    }
}

