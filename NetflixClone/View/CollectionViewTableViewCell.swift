//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by Артур Дохно on 02.05.2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
