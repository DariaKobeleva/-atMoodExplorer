//
//  ViewController.swift
//  СatMoodExplorer
//
//  Created by Дарья Кобелева on 20.03.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var catImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
    //MARK: - Private Methods
    private func fetchImage() {
        networkManager.fetchImage(from: Link.image.url) { [unowned self] result in
            switch result {
            case .success(let imageData):
                catImage.image = UIImage(data: imageData)
                activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}

