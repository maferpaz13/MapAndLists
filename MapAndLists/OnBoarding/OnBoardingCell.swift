//
//  OnBoardingCollectionViewCell.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 9/06/22.
//

import UIKit

class OnBoardingCel: UICollectionViewCell {
    @IBOutlet var Imagen : UIImageView!
    @IBOutlet var Imagen2 : UIImageView!
    @IBOutlet var ImagenFondo : UIImageView!
    @IBOutlet var titulo1 : UILabel!
    @IBOutlet var SaltarButton : UIButton!
    @IBOutlet weak var pageviwew: UIPageControl!
    @IBOutlet weak var IrAtrasButton: UIButton!
    @IBOutlet weak var IrAtrasImage: UIImageView!
    
}

extension OnBoardingViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ElementsArrayTutorial.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCel", for: indexPath) as? OnBoardingCel
        
        cell!.titulo1.text = ElementsArrayTutorial[index].titulo
        cell!.ImagenFondo.image = ElementsArrayTutorial[index].imagen
        cell?.IrAtrasImage.isHidden = false
        cell?.IrAtrasButton.isHidden = false
        cell?.IrAtrasImage.image = UIImage.init(named: "ic_back_icon_white")
        cell!.pageviwew.currentPage = index
        
        var tituloSaltar = "Saltar"
        if (ElementsArrayTutorial.count - 1) == indexPath.row {
            tituloSaltar = "Terminar"
        }
        
        switch indexPath.row {
        case 0:
            cell?.IrAtrasImage.isHidden = true
            cell?.IrAtrasButton.isHidden = true
        case 2:
            yourAttributes = [.font: UIFont(name:"HurmeGeometricSans3-Regular", size:17)!,
                              .foregroundColor: UIColor.black,
                              .underlineStyle: NSUnderlineStyle.single.rawValue]
            cell?.titulo1.textColor = .black
            cell?.IrAtrasImage.image = UIImage.init(named: "ic_back_icon")
        default:
            yourAttributes = [.font: UIFont(name:"HurmeGeometricSans3-Regular", size:17)!,
              .foregroundColor: UIColor.white,
             .underlineStyle: NSUnderlineStyle.single.rawValue]
            
            cell?.titulo1.textColor = .white
        }
        
        cell?.IrAtrasButton.addTarget(self, action: #selector(self.backAction(sender:)), for: .touchUpInside)
        
        let attributeString = NSMutableAttributedString(
                string: tituloSaltar,
                attributes: yourAttributes
             )
        
        cell?.SaltarButton.setAttributedTitle(attributeString, for: .normal)
        
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = UIScreen.main.bounds
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
        
    }
    @objc public func backAction(sender: UIButton) {
        
        IrAlaDerecha()
            
    }
}

