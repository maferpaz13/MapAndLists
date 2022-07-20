//
//  BitacoraTableViewCell.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 4/07/22.
//

import UIKit

class BitacoraTableViewCell: UITableViewCell {
    @IBOutlet weak var FechaLabel: UILabel!
    @IBOutlet weak var EventoLabel: UILabel!
    @IBOutlet weak var ComentarioLabel: UILabel!
    @IBOutlet weak var SoporteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
