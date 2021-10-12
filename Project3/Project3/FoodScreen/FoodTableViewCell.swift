//
//  FoodTableViewCell.swift
//  Project3
//
//  Created by Anna Han on 12/10/20.
//

import UIKit
import AlamofireImage
class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBOutlet weak var makerImage: UIImageView!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func configure(with viewModel: RestaurantListModel){
//        restaurantImage.af_setImage(withURL: viewModel.image_url)
//        restaurantNameLabel.text = viewModel.name
//        locationLabel.text = viewModel.distance
//    }
}
