//
//  Coordinator.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 18.04.2023.
//

import UIKit

enum Event {
    case showSecondVC

}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccured(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }

  

}

