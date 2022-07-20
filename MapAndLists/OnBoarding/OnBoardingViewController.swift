//
//  OnBoardingViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 9/06/22.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet weak var CollectionView: UICollectionView!
    
    //MARK: - Properties
    var Auxrow: Int8! = 0
    var ElementsArrayTutorial: [(titulo: String, imagen: UIImage)] = []
    //MARK: - Constantes
    var yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont(name:"HurmeGeometricSans3-Regular", size:17)!,
          .foregroundColor: UIColor.white,
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "Inicioono")
        setUpUI()
        
    }
    
    func setUpUI() {
        
        ElementsArrayTutorial.append((titulo: "Mejora tus posibilidades de encontrar viajes de retorno de forma fácil y sin demoras.", imagen: UIImage(named: "bg_tutorial_uno")!))
        ElementsArrayTutorial.append((titulo: "Realiza tus despachos sin demoras y sin la necesidad de acercarte a una oficina para poder recibir un servicio.", imagen: UIImage(named: "bg_tutorial_two")!))
        ElementsArrayTutorial.append((titulo: "Benefíciate de menor tiempo de atención y reduce la espera de cargue y descargue por servicio.", imagen: UIImage(named: "bg_tutorial_three")!))
        ElementsArrayTutorial.append((titulo: "Accede a una importante red de conductores y de carga en constante comunicación.", imagen: UIImage(named: "bg_tutorial_four")!))
        ElementsArrayTutorial.append((titulo: "Ten ofertas de servicios cerca a tu ubicación", imagen: UIImage(named: "bg_tutorial_five")!))
        ElementsArrayTutorial.append((titulo: "Te brindamos asistencia permanentemente para cualquier eventualidad o emergencia que se te presente en el camino", imagen: UIImage(named: "bg_tutorial_four-1")!))
        
        CollectionView.reloadData()
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swipeleft.direction = .left
        
        CollectionView.addGestureRecognizer(swipeleft)
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(self.Gesture(gesture:)))
        
        swiperight.direction = .right
        
        CollectionView.addGestureRecognizer(swiperight)
        
    }
    
    public func IrAlaDerecha() {
        if Auxrow != 0 {
            
            Auxrow -= 1
            
            self.CollectionView.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }
    }
    
    @objc func Gesture(gesture: UISwipeGestureRecognizer) -> Void{
        
        if gesture.direction == UISwipeGestureRecognizer.Direction.right{
            
            IrAlaDerecha()
            
        }else if gesture.direction == UISwipeGestureRecognizer.Direction.left{
            
            if Auxrow != 5 {
                
                Auxrow += 1
                
                self.CollectionView.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
                
            }
            
        }
        
    }
}
