//
//  TherapyCollectionViewCell.swift
//  Therapy-Task
//
//  Created by Mohammad Zaid on 10/02/23.
//

import UIKit

class TherapyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: className(), bundle: nil)
    }
    
    static func reuseIdentifier() -> String {
        return className()
    }
    
    func configure(therapy: TherapyListDetail) {
        guard let url = URL(string: therapy.profile) else {
            return
        }
        
        DispatchQueue.global().async {
            // Fetch Image Data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // Create Image and Update Image View
                    self.imgView.image = UIImage(data: data)
                }
            }
        }
        lblTitle.text = therapy.name
    }

}
