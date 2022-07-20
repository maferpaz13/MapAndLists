//
//  GuiaDeCargaTableViewCell.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 30/06/22.
//

import UIKit

class GuiaDeCargaTableViewCell: UITableViewCell {
    @IBOutlet weak var NumProductLabel: UILabel!
    @IBOutlet weak var CantidadLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
