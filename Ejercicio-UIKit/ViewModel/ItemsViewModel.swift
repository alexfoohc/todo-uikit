//
//  ItemsViewModel.swift
//  Ejercicio-UIKit
//
//  Created by Alejandro Hernandez on 15/09/23.
//

import Foundation


protocol ItemDelegate: AnyObject {
    func reload()
}

class ItemsViewModel {
    
    var items: Items = [] {
        didSet {
            self.itemDelegate?.reload()
        }
    }
    
    private let serviceManager = ServiceManager()
    weak var itemDelegate: ItemDelegate?
   
    
    @MainActor func fetchItems() {
        Task {
            do{
                let items: Items = try await serviceManager.fetchItems(url: endpoint)
                self.items = items
            } catch {
                print("There was an error")
            }
        }
    }
    
}
