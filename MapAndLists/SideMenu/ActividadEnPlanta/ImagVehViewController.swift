//
//  ImagVehViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 8/07/22.
//

import UIKit
import Foundation
import SDWebImage
import NotificationBannerSwift

class ImagVehViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var VerDocumentacion: UIButton!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBAction func Back(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func VerDocumentacion(_ sender: Any) {
        
        let alert = UIAlertController(title: "MapAndList", message: "Seleccione una Acción", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "VER MANIFIESTO", style: .default, handler: { action in
            
            let manifiest = self.manifiesto.filter({$0.request_id == self.vehiculo?.id})
            
                if manifiest.indices.contains(0) {
                
                    guard let url = URL(string: EndPoints.domain+manifiest[0].manifest!) else { return }
                UIApplication.shared.open(url)
            }
                else{
                NotificationBanner.init(title: "Error", subtitle: "No hay manifiesto",  style: .info).show()
            }
            
            
        }))
        alert.addAction(UIAlertAction(title: "ORDEN DE CARGA", style: .default, handler: { action in
            let orden = self.manifiesto.filter({$0.request_id == self.vehiculo?.id})
                if orden.indices.contains(0) {
                
                    guard let url = URL(string: EndPoints.domain+orden[0].loading_order!) else { return }
                UIApplication.shared.open(url)
            }else{
                NotificationBanner.init(title: "Error", subtitle: "No hay orden de carga",  style: .info).show()
            }
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "VER HOJA DE TIEMPO", style: .default, handler: { action in
            let hoja = self.manifiesto.filter({$0.request_id == self.vehiculo?.id})
        
                if hoja.indices.contains(0) {
                
                    guard let url = URL(string: EndPoints.domain+hoja[0].timesheet!) else { return }
                UIApplication.shared.open(url)
            }else{
                NotificationBanner.init(title: "Error", subtitle: "No hay hoja de tiempo",  style: .info).show()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            @unknown default:
                break
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    var Auxrow: Int8! = 0
    var ElementsArrayVeh: [(String)] = []
    var vehiculo: VehCargueDescargueModel.Vehicles_load?
    var manifiesto: [(VehCargueDescargueModel.Document_requests_link)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
    }
    
    func setUpUI() {
        
        if let front_vehicule = vehiculo?.vehicle?.front_vehicle?.url {
           
            ElementsArrayVeh.append(front_vehicule)
            
        }
        
        
        if let rear_vehicule = vehiculo?.vehicle?.rear_vehicle?.url {
           
            ElementsArrayVeh.append(rear_vehicule)
            
        }
        
        if let panoramic_vehicule = vehiculo?.vehicle?.picture_panoramic_vehicle?.url {
           
            ElementsArrayVeh.append(panoramic_vehicule)
            
        }
        
        if let trailer_picture = vehiculo?.trailer?.picture?.url {
            
            ElementsArrayVeh.append(trailer_picture)
            
        }
        
        VerDocumentacion.layer.cornerRadius = 8
        
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
        
        if Auxrow != (ElementsArrayVeh.count - 1) {
            
            Auxrow += 1
            
            self.CollectionView.scrollToItem(at: IndexPath(row: Int(Auxrow), section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
            
                }
            }
        }
    }
