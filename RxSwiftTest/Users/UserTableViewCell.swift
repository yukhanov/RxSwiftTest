//
//  UserTableViewCell.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 02.05.2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: UserTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
