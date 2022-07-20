//
//  NvSolicitud5ViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 16/07/22.
//

import UIKit

class NvSolicitud5ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var cargueStack: UIStackView!
    @IBOutlet weak var descargueStack: UIStackView!
    @IBOutlet weak var labelDelButtonDescargue: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDelButtonCargue: UILabel!
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    
    //MARK: - IBActions
    @IBAction func direcPlantaButtonCargue(_ sender: Any) {
        route_id = NvSolicitud5ViewController.creacionstruct.businessroute_id!
        load = true
        unload = false
        self.performSegue(withIdentifier: "showDireccion", sender: nil)
       
    }
    
    @IBAction func direcPlantaButtonDescargue(_ sender: Any) {
        
        route_id = NvSolicitud5ViewController.creacionstruct.businessroute_id!
        load = false
        unload = true
        self.performSegue(withIdentifier: "showDireccion", sender: nil)
        
    }
    @IBAction func AgregarButton(_ sender: Any) {
        
        let agregarButtonCargue = (Bundle.main.loadNibNamed("vistseleccionproduct", owner: self, options: nil)?.first as? vistseleccionproduct)!
        arraystackCargue.append(agregarButtonCargue)
        cargueStack.addArrangedSubview(agregarButtonCargue)
        
        agregarButtonCargue.cancelButton.addTarget(self, action: #selector(self.CloseStackView(_:)), for: .touchUpInside)
        agregarButtonCargue.cancelButton.tag = (0...999).randomElement()!
        
    }
    
    @IBAction func agregarButtonDescargue(_ sender: Any) {
        
        let agregarButtonDescargue = (Bundle.main.loadNibNamed("vistseleccionproduct", owner: self, options: nil)?.first as? vistseleccionproduct)!
        arraystackDescargue.append(agregarButtonDescargue)
        descargueStack.addArrangedSubview(agregarButtonDescargue)
        let bottomOffset = CGPoint(x: 0, y: (scrollView.contentSize.height + 130) - scrollView.bounds.height + scrollView.contentInset.bottom)
        scrollView.setContentOffset(bottomOffset, animated: true)
        
        agregarButtonDescargue.cancelButton.addTarget(self, action: #selector(self.CloseStackView2(_:)), for: .touchUpInside)
        agregarButtonDescargue.cancelButton.tag = (0...999).randomElement()!
        
    }
    
    @IBAction func ContinuarButton(_ sender: Any) {
        
        
    }
    
    //MARK: - Properties
    var route_id: Int = 0
    var load: Bool = false
    var unload: Bool = false
    static var plantLoad : direccionModel.Datas? = nil
    static var plantLoad2 : direccionModel.Datas? = nil
    var arraystackCargue: [(vistseleccionproduct)] = []
    var arraystackDescargue: [(vistseleccionproduct)] = []
    static var creacionstruct = creacionModel.creacionData.init(business_id: nil, booking_type_id: nil, businessroute_id: nil, cantcar: nil, carconfig_id: nil, cartype_id: nil, office_dispatch_id: nil, emite_id: nil, recibe_id: nil, paga_id: nil, has_a_loading_date: nil, date: nil, date2: nil, loading_time_slot: nil, exclusive_fleet: nil, manage_paper: nil, comment: nil, observation_client: nil, bigcustomer_id: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDireccion" {
            let destinationVC = segue.destination as! DireccionPlantaViewController
            destinationVC.load = load
            destinationVC.unload = unload
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NvSolicitud2VistaViewController.vistas = .NvSolicitud5ViewController
        NvSolicitud2VistaViewController.label?.text = "Dirección de cargue y descargue"
        
        if let labelbutton = NvSolicitud5ViewController.plantLoad?.name! {
        
        labelDelButtonCargue.text = labelbutton
            
        }
        
        if let labelbutton2 = NvSolicitud5ViewController.plantLoad2?.name! {
        
        labelDelButtonDescargue.text = labelbutton2
            
        }
        
    }

    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.bottomLayout.constant == 70 {
                self.bottomLayout.constant = keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.bottomLayout.constant != 70 {
            self.bottomLayout.constant = 70
        }
    }
    
    @objc func CloseStackView(_ sender: UIButton) {
        let tag = sender.tag
        
        let arrayfiltrado = arraystackCargue.filter{$0.cancelButton.tag == tag}
        
        if arrayfiltrado.indices.contains(0) {
            
            cargueStack.removeArrangedSubview(arrayfiltrado[0])
            arrayfiltrado[0].removeFromSuperview()
            
            print(arraystackCargue.count)
            let index = arraystackCargue.firstIndex(of: arrayfiltrado[0])!
            arraystackCargue.remove(at: index)
            print(arraystackCargue.count)
            
        }
    }
        @objc func CloseStackView2(_ sender: UIButton) {
            let tag = sender.tag
            
            let arrayfiltrado2 = arraystackDescargue.filter{$0.cancelButton.tag == tag}
            
            if arrayfiltrado2.indices.contains(0) {
                
                descargueStack.removeArrangedSubview(arrayfiltrado2[0])
                arrayfiltrado2[0].removeFromSuperview()
                
                print(arraystackDescargue.count)
                let index = arraystackDescargue.firstIndex(of: arrayfiltrado2[0])!
                arraystackDescargue.remove(at: index)
                print(arraystackDescargue.count)
                
            }
        
        
    }
    
    func setUpUI() {
        
        
    }
    
    

}
