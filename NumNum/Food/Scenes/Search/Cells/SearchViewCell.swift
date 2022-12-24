//
//  SearchViewCell.swift
//  NumNum
//
//  Created by Ekrem Alkan on 23.12.2022.
//

import UIKit
import SDWebImage
import Firebase


protocol SearchViewCellProtocol {
    var searchCellImage: String { get }
    var searchTitleLabel: String { get }
    var searchCalorieLabel: String { get }
}
class SearchViewCell: UICollectionViewCell {
    
    private let database = Database.database().reference()
    private let currentUser = Auth.auth().currentUser
    
    var items: Dish?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    func configure(data: SearchViewCellProtocol) {
        image.sd_setImage(with: URL(string: data.searchCellImage))
        image.layer.cornerRadius = 10
        titleLabel.text = data.searchTitleLabel
        calorieLabel.text = "\(data.searchCalorieLabel)kcal"
    }
}
