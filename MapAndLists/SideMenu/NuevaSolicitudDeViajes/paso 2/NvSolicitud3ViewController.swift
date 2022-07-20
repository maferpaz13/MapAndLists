//
//  NevSolicitud3ViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 14/07/22.
//

import UIKit
import NotificationBannerSwift

enum opcionSeleccionada2 {
    case Emite
    case Paga
    case Recibe
}


class NvSolicitud3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //MARK: - IBOutlets
    @IBOutlet weak var emiteLabel: UILabel!
    @IBOutlet weak var RecibeLabel: UILabel!
    @IBOutlet weak var buttonout: UIButton!
    @IBOutlet weak var pagaLabel: UILabel!
    
    //MARK: - IBActions
    
    
    @IBAction func PagaButton(_ sender: Any) {
        
        ViewModel.getpaga { (Result) in
            if let arraypagas = Result?.data {
                
                self.opcionesSeleccionadas2 = .Paga
                self.arrayPaga = arraypagas
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Paga"
                
            }
            
        }
        
    }
    
    @IBAction func Continuar(_ sender: Any) {
        self.performSegue(withIdentifier: "showPaso3", sender: nil)
    }
    @IBAction func RecibeButton(_ sender: Any) {
        
        ViewModel.getrecibe { (Result) in
            if let arrayrecibes = Result?.data {
                
                self.opcionesSeleccionadas2 = .Recibe
                self.arrayrecibe = arrayrecibes
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Recibe"
                
            }
            
        }
        
    }
    
    @IBAction func EmiteButton(_ sender: Any) {
        
        ViewModel.getemite { (Result) in
            if let arrayemites = Result?.data {
                
                self.opcionesSeleccionadas2 = .Emite
                self.arrayemite = arrayemites
                self.vistaTable.tablaopciones.reloadData()
                self.vistaTable.isHidden = false
                self.vistaTable.titulo.text = "Emite"
                
            }
            
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Properties
    var vistaTable: VistaTable!
    var ViewModel = CreacionServ2ViewModel()
    var arrayPaga: [(pagaModel.Datas)] = []
    var arrayrecibe: [(recibeModel.Datas)] = []
    var arrayemite: [(emiteModel.Datas)] = []
    var opcionesSeleccionadas2 : opcionSeleccionada2!
    static var navigation: UINavigationController? = nil
    
    
    //MARK: - Constants
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        NvSolicitud2VistaViewController.vistas = .NvSolicitud3ViewController
        buttonout.layer.cornerRadius = 8
    }
    override func viewWillAppear(_ animated: Bool) {
        NvSolicitud2VistaViewController.label?.text = "Información de facturación"
    }
    
    @objc func CloseVistaTable(_ sender: UITapGestureRecognizer) {
        
        vistaTable.isHidden = true
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vistaTable.isHidden = true
        switch opcionesSeleccionadas2 {
        case .Emite:
            emiteLabel.text = arrayemite[indexPath.row].fullname!
            NvSolicitud5ViewController.creacionstruct.emite_id = arrayemite[indexPath.row].id!
        case .Paga:
            pagaLabel.text = arrayPaga[indexPath.row].fullname!
            NvSolicitud5ViewController.creacionstruct.paga_id = arrayPaga[indexPath.row].id!
        case .Recibe:
            RecibeLabel.text = arrayrecibe[indexPath.row].fullname!
            NvSolicitud5ViewController.creacionstruct.recibe_id = arrayrecibe[indexPath.row].id!
        default:
            break
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch opcionesSeleccionadas2 {
        case .Emite:
            if arrayemite.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayemite.count) * 40
            }else{
                self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayemite.count
        case .Paga:
            if arrayPaga.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayPaga.count) * 40
            }else{
            self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayPaga.count
        case .Recibe:
            if arrayrecibe.count <= 8 {
            self.vistaTable.heigt.constant = CGFloat(arrayrecibe.count) * 40
            }else{
                self.vistaTable.heigt.constant = 8 * 40
            }
            return arrayrecibe.count
        default:
            return 0
            }
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCelVistaTable", for: indexPath) as! InfoCellTableViewCell
        
        
        switch opcionesSeleccionadas2 {
        case .Emite :
            cell.Thingslabel.text = arrayemite[index].fullname!
            return cell
        case .Paga :
            cell.Thingslabel.text = arrayPaga[index].fullname!
            return cell
        case .Recibe:
            cell.Thingslabel.text = arrayrecibe[index].fullname!
        default:
            break
            
        }
        return cell
    }
    
    
    func setUpUI() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.CloseVistaTable(_:)))
        vistaTable = SetupValorOfertar(vista: self, Titulo: "Negocio", cancelar: tap)
        vistaTable.tablaopciones.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "showCelVistaTable")
        
        
        }
    }
