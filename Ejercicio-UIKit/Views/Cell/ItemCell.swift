//
//  ItemCell.swift
//  Ejercicio-UIKit
//
//  Created by Alejandro Hernandez on 16/09/23.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var completedImageView: UIImageView!
    
    static let reuserIdentifier = "itemCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup() {
        titleLable.lineBreakMode = .byTruncatingMiddle
        titleLable.font = .systemFont(ofSize: 16)
        userIdLabel.textColor = .lightGray
        userIdLabel.font = .systemFont(ofSize: 14)
    }
    
}
