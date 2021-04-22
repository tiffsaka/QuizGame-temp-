//
//  FilterViewController.swift
//  QuizGame
//
//  Created by Tiffany Sakaguchi on 4/22/21.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func shapeWasSelected(shape: String)
}


class FilterViewController: UIViewController {

    
    //MARK: - Properties
    
    weak var delegate: FilterSelectionDelegate?
    
    
    //MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: - Actions
    
    @IBAction func circleButtonTapped(_ sender: Any) {
        delegate?.shapeWasSelected(shape: "circle")
        self.dismiss(animated: true)
    }
    
    @IBAction func triangleButtonTapped(_ sender: Any) {
        delegate?.shapeWasSelected(shape: "triangle")
        self.dismiss(animated: true)
    }
    
}//End of class
