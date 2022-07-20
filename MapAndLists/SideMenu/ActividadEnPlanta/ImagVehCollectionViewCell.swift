//
//  ImagVehCollectionViewCell.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 8/07/22.
//

import UIKit
import SDWebImage

class ImagVehCollectionViewCell: UICollectionViewCell {
    @IBOutlet var Imagen : UIImageView!
    @IBOutlet weak var pageviwew: UIPageControl!
}

extension ImagVehViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ElementsArrayVeh.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showImageCell", for: indexPath) as? ImagVehCollectionViewCell
        cell?.Imagen.sd_setImage(with: URL(string: (ElementsArrayVeh[index])), placeholderImage: (UIImage.init(named: "180")!))
        cell?.pageviwew.currentPage = index
        
        return cell!
    }
}
