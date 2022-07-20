//
//  popUpViews.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/06/22.
//

import UIKit
import Lottie

    var loadingView = LoadingViewController()
    
    func showLoadingView(vista: UIViewController) {
        
        loadingView = (Bundle.main.loadNibNamed("LoadingView", owner: vista, options: nil)?.first as? LoadingViewController)!
        vista.view.addSubview((loadingView))
        
        loadingView.frame = CGRect(x: vista.view.center.x - (vista.view.frame.width/2), y: vista.view.center.y - (vista.view.frame.height/2), width: vista.view.frame.width, height: vista.view.frame.height)
        
        let animation = Animation.named("truckloadings",subdirectory: "Animaciones")
        loadingView.LoadingView.backgroundColor = .clear
        loadingView.LoadingView.animation = animation
        loadingView.LoadingView.contentMode = .scaleAspectFit
        loadingView.LoadingView.play(fromFrame: 0, toFrame: 200.0, loopMode: .loop, completion: nil)
        loadingView.isHidden = false
        
    }
    
    func HideLoadingView(vista: UIViewController) {
        
        DispatchQueue.main.async {
            
            loadingView.isHidden = true
            loadingView.removeFromSuperview()
        }
        
    }



func SetupValorOfertar(vista:UIViewController,Titulo:String, cancelar: UITapGestureRecognizer!) -> VistaTable {
    
    let tablaadaptablebuscador = (Bundle.main.loadNibNamed("VistaTable", owner: vista, options: nil)?.first as? VistaTable)!
    
    tablaadaptablebuscador.tablaopciones.delegate = vista as? UITableViewDelegate
    tablaadaptablebuscador.tablaopciones.dataSource = vista as? UITableViewDataSource
    tablaadaptablebuscador.frame =  CGRect(x: vista.view.center.x - (vista.view.frame.width / 2), y:vista.view.center.y - CGFloat((vista.view.frame.height / 2)), width:vista.view.frame.width, height:vista.view.frame.height)
    
    tablaadaptablebuscador.cancelar.addGestureRecognizer(cancelar)
    
    tablaadaptablebuscador.isHidden = true
    
    vista.view.addSubview(tablaadaptablebuscador)
        return tablaadaptablebuscador
    
}

