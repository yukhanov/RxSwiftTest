//
//  SecondViewController.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 18.04.2023.
//

import UIKit
import RxSwift
import RxCocoa


class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    
    let disposeBag = DisposeBag()
    let viewModel = ViewModel()

    
     var nameSecondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nameSecondLabel)
        setConstraints()
        
        view.backgroundColor = .white
    }
}

extension SecondViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameSecondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameSecondLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
}
