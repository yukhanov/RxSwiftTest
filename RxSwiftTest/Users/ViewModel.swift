//
//  ViewModel.swift
//  RxSwiftTest
//
//  Created by Сергей Юханов on 02.05.2023.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
 
    var users = BehaviorSubject(value: [User]())
    
    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let responseData = try JSONDecoder().decode([User].self, from: data)
                self.users.onNext(responseData)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    func addUser(user: User) {
        guard var users = try? users.value() else { return }
        users.insert(user, at: 0)
        self.users.onNext(users)
    }
    
    func deleteUser(index: Int) {
        guard var users = try? users.value() else { return }
        users.remove(at: index)
        self.users.onNext(users)
    }
    
    func editUser(title: String, index: Int) {
        
    }
}
