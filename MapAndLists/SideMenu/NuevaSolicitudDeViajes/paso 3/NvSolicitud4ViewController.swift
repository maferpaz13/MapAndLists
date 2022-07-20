//
//  NvSolicitud3ViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 15/07/22.
//

import UIKit
import DatePickerDialog

class NvSolicitud4ViewController: UIViewController {
    
    @IBOutlet weak var tieneFecha: UITextField!
    @IBOutlet weak var buttonout: UIButton!
    @IBOutlet weak var tieneHoraView: UIView!
    @IBOutlet weak var tieneHora: UITextField!
    @IBOutlet weak var tieneHorarioView: UIView!
    @IBOutlet weak var tieneHorarioLabel: UILabel!
    
    @IBAction func ContinuarButton(_ sender: Any) {
        self.performSegue(withIdentifier: "showPaso3", sender: nil)
    }
    
    @IBAction func tieneHorario(_ sender: Any) {
        
        let alert = UIAlertController(title: "MapAndList", message: "Seleccione una Acción", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Todo el Dia", style: .default, handler: { action in
            //id 1
            self.tieneHorarioLabel.text = "Todo el Dia"
            NvSolicitud5ViewController.creacionstruct.loading_time_slot = 1
            
        }))
        alert.addAction(UIAlertAction(title: "En la Mañana", style: .default, handler: { action in
            //id 2
            self.tieneHorarioLabel.text = "En la Mañana"
            NvSolicitud5ViewController.creacionstruct.loading_time_slot = 2
        }))
        alert.addAction(UIAlertAction(title: "En la Tarde", style: .default, handler: { action in
            //id 3
            self.tieneHorarioLabel.text = "En la Tarde"
            NvSolicitud5ViewController.creacionstruct.loading_time_slot = 3
            
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
    
    @IBAction func HaveDateTimeButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "MapAndList", message: "Seleccione una Acción", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "SI", style: .default, handler: { action in
            NvSolicitud5ViewController.creacionstruct.has_a_loading_date = true
            self.tieneHoraView.isHidden = false
            self.tieneHorarioView.isHidden = true
            
            
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: { action in
            NvSolicitud5ViewController.creacionstruct.has_a_loading_date = false
            
            self.tieneHorarioView.isHidden = false
            self.tieneHoraView.isHidden = true
            
            
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
    
    static var navigation: UINavigationController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NvSolicitud2VistaViewController.vistas = .NvSolicitud4ViewController
        buttonout.layer.cornerRadius = 8
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        if #available(iOS 13.4, *) {
            datePickerView.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        let toolBar = UIToolbar()
            toolBar.barStyle = .default
            toolBar.isTranslucent = true
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(onClickDoneButton))
            toolBar.setItems([space, doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            toolBar.sizeToFit()
        tieneFecha.inputAccessoryView = toolBar
        
        tieneFecha.inputView = datePickerView
        datePickerView.addTarget(self, action:
                                    #selector(handleDatePicker), for: UIControl.Event.valueChanged)
        
        let datePickerView2  : UIDatePicker = UIDatePicker()
        datePickerView2.datePickerMode = UIDatePicker.Mode.dateAndTime
        if #available(iOS 13.4, *) {
            datePickerView2.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        let toolBar2 = UIToolbar()
            toolBar2.barStyle = .default
            toolBar2.isTranslucent = true
            let space2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton2 = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton2))
            toolBar2.setItems([space2, doneButton2], animated: false)
            toolBar2.isUserInteractionEnabled = true
            toolBar2.sizeToFit()
        tieneHora.inputAccessoryView = toolBar2
        
        tieneHora.inputView = datePickerView2
        datePickerView2.addTarget(self, action:
                                    #selector(handleDatePicker2), for: UIControl.Event.valueChanged)

            }
    
    override func viewWillAppear(_ animated: Bool) {
        NvSolicitud2VistaViewController.label?.text = "Fechas"
        NvSolicitud2VistaViewController.vistas = .NvSolicitud4ViewController
    }
    
    @objc func onClickDoneButton() {
        self.view.endEditing(true)
    }
    @objc func onClickDoneButton2() {
        self.view.endEditing(true)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        tieneFecha.text = dateFormatter.string(from: sender.date)
    }
    @objc func handleDatePicker2(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        tieneFecha.text = dateFormatter.string(from: sender.date)
    }
}
