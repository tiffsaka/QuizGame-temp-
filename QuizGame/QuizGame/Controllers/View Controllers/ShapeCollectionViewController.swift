//
//  ShapeCollectionViewController.swift
//  QuizGame
//
//  Created by Tiffany Sakaguchi on 4/22/21.
//

import UIKit

class ShapeCollectionViewController: UICollectionViewController {

    //MARK: - Properties
    
    var displayedShapes: [Shape] = []
    var correctShape: Shape?
    var selectedShapeCategory = "circle"
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleShapes(shape: selectedShapeCategory)
    }

    
    //MARK: - Helper Methods
    func shuffleShapes(shape: String) {
        if shape == "circle" {
            let shuffledTriangles = ShapeController.triangle.shuffled()
            let triangleGroup = shuffledTriangles.prefix(3)
            displayedShapes = Array(triangleGroup)
            correctShape = ShapeController.circle.randomElement()
        } else {
            let shuffledCircles = ShapeController.circle.shuffled()
            let circleGroup = shuffledCircles.prefix(3)
            displayedShapes = Array(circleGroup)
            correctShape = ShapeController.triangle.randomElement()
        }
        updateViews()
    }
    
    func updateViews() {
        guard let shape = correctShape else { return }
        displayedShapes.append(shape)
        displayedShapes.shuffle()
        self.title = "Find the \(shape.shapeType)"
        collectionView.reloadData()
    }
    
    func presentAlert(shape: Shape) {
        let success = shape == correctShape
        
        let alertController = UIAlertController(title: success ? "Woohoo! Correct!" : "Nope, try again.", message: nil , preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { (_) in
            self.shuffleShapes(shape: self.selectedShapeCategory)
        }
        
        alertController.addAction(doneAction)
        
        if success {
            alertController.addAction(shuffleAction)
        }
        present(alertController, animated: true)
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterVC" {
            guard let destination = segue.destination as? FilterViewController else { return }
            destination.delegate = self
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedShapes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shapeCell", for: indexPath) as? ShapeCollectionViewCell else { return UICollectionViewCell()}
    
        let shape = displayedShapes[indexPath.row]
        
        cell.shape = shape
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedShapeCategory = displayedShapes[indexPath.row]
        presentAlert(shape: selectedShapeCategory)
    }
    
}//End of class


//MARK: - Extensions

extension ShapeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 30)
    }
}//End of extension

extension ShapeCollectionViewController: FilterSelectionDelegate {
    func shapeWasSelected(shape: String) {
        selectedShapeCategory = shape
        shuffleShapes(shape: shape)
    }
}//End of extension
