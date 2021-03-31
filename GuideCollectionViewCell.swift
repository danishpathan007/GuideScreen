//
//  GuideCollectionViewCell.swift
//  PageController
//
//  Created by Danish Khan on 18/01/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var guideImageView: UIImageView!
    @IBOutlet weak var guideDescriptionLabel: UILabel!
    @IBOutlet weak var guideTitleLabel: UILabel!
    
    func setCellData(image:UIImage,title:String,cellDescription:String){
        guideImageView.image = image
        guideTitleLabel.text = title
        guideDescriptionLabel.text = cellDescription
    }
    
}
