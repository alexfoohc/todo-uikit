//
//  Item.swift
//  Ejercicio-UIKit
//
//  Created by Alejandro Hernandez on 15/09/23.
//

import Foundation

typealias Items = [Item]

struct Item: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
    
    init(id: Int, userId: Int, title: String, completed: Bool) {
        self.id = id
        self.userId = userId
        self.title = title
        self.completed = completed
    }
}
