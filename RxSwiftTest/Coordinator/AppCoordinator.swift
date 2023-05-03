//
//  AppCoordinator.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 18.04.2023.
//

import UIKit

class AppCoordinator: Coordinator {

    
    var navigationController: UINavigationController?

    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
        
        
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .showSecondVC:
            var vc: UIViewController & Coordinating = SecondViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: true)
            
        }


        }
    }

    


