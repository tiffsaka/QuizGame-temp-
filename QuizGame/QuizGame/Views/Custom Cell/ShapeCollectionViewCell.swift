//
//  ShapeCollectionViewCell.swift
//  QuizGame
//
//  Created by Tiffany Sakaguchi on 4/22/21.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var shapeImageView: UIImageView!
    
    
    //MARK: - Properties
    var shape: Shape? {
        didSet {
            updateViews()
        }
    }
    
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let shape = shape else { return }
        shapeImageView.contentMode = .scaleAspectFit
        shapeImageView.image = shape.photo
    }
    
} //End of class
