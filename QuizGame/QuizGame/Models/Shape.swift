//
//  Shape.swift
//  QuizGame
//
//  Created by Tiffany Sakaguchi on 4/22/21.
//

import UIKit

class Shape {
        
    let photo: UIImage?
    let shapeType: String
    let uuid: String
        
    init(photo: UIImage?, shapeType: String, uuid: String = UUID().uuidString) {
        self.photo = photo
        self.shapeType = shapeType
        self.uuid = uuid
    }
 
}//End of class


//MARK: - Extensions
extension Shape: Equatable {
    static func == (lhs: Shape, rhs: Shape) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}//End of extension


