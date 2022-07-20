//
//  ServiciosSolicitadosTableViewCell.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 28/06/22.
//

import UIKit

class ServiciosSolicitadosTableViewCell: UITableViewCell {
    @IBOutlet weak var EmpresaLabel: UILabel!
    @IBOutlet weak var NombreLabel: UILabel!
    @IBOutlet weak var NumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
