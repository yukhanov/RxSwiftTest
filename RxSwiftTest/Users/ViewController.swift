//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 18.04.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    let bag = DisposeBag()
    let viewModel = ViewModel()
    lazy var usersTableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addButtonTapped))
        title = "Users"
        navigationItem.rightBarButtonItem = addButton
        view.addSubview(usersTableView)
        viewModel.fetchUsers()
        bindTableView()
    
        view.backgroundColor = .white
    }
    
    @objc func addButtonTapped() {
        let user = User(userId: 48954, id: 4534, title: "Sergey", body: "RxSwift")
        viewModel.addUser(user: user)
    }
    
    func bindTableView() {
        usersTableView.rx.setDelegate(self).disposed(by: bag)
        viewModel.users.bind(to: usersTableView.rx.items(cellIdentifier: UserTableViewCell.identifier, cellType: UserTableViewCell.self)) { (row, item, cell) in
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = "\(item.id)"
        }.disposed(by: bag)
        
        usersTableView.rx.itemSelected.subscribe { indexPath in
            print(indexPath.row)
        }.disposed(by: bag)
        
        usersTableView.rx.itemDeleted.subscribe { [weak self] indexPath in
            guard let self = self else { return }
            viewModel.deleteUser(index: indexPath.row)
        }.disposed(by: bag)
        
    }
    
    @objc func goToNextVC() {
    
        coordinator?.eventOccured(with: .showSecondVC)
    }

}

extension ViewController: UITableViewDelegate {
    
}


