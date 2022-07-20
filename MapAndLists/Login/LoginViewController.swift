//
//  ViewController.swift
//  MapAndLists
//
//  Created by Maria Fernanda Paz Rodriguez on 8/06/22.
//

import UIKit
import Alamofire
import Lottie
import NotificationBannerSwift


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var ContraseñaTextField: UITextField!
    @IBOutlet weak var UsuarioTextField: UITextField!
    @IBOutlet weak var IniciarSesionButtonOut: UIButton!
    @IBOutlet weak var imageRecordar: UIImageView!
    @IBOutlet weak var VisibilidadOutlet: UIImageView!
    @IBOutlet weak var OlvidoContraseñaButtonOut: UIButton!
    @IBOutlet weak var VistaContraseña: UIView!
    @IBOutlet weak var RecordarLabel: UILabel!
    @IBOutlet weak var RecordarContraseñaButtonOut: UIButton!
    static var loginInfo: LoginModel.LoginModelData? = nil
    
    //MARK: - IBActions
    
    @IBAction func VisibilidadAction(_ sender: Any) {
        switchImageVisibilidad()
        
    }
    
    @IBAction func RecordarContraseñaButton() {
        switchImage()
    }
    
    @IBAction func OlvidoContraseñaButton() {
        guard let url = URL(string: "http://st.fletx.co:5000") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func IniciarSesionButton() {
        loginAction()
    }
    
    //MARK: - Constantes
    let ViewModel = LoginViewModel()
    let defaults = UserDefaults.standard
    
    //MARK: - Variables
    private var lottieAnimation: AnimationView?
    private var backLottieAnimation: AnimationView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UsuarioTextField.delegate = self
        self.ContraseñaTextField.delegate = self
        self.hideKeyboardWhenTappedAround()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        recoverData()
        
    }
    private func setupUI() {
        IniciarSesionButtonOut.layer.cornerRadius = 8
        VistaContraseña.layer.cornerRadius = 8
        VistaContraseña.layer.borderColor = UIColor(named: "BorderColor")!.cgColor
        VistaContraseña.layer.borderWidth = 1
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    func loginAction() {
        
        let usuario = UsuarioTextField.text!
        let contraseña = ContraseñaTextField.text!
        
       
        
        if !usuario.isValidEmail(){
            NotificationBanner(title: "Error", subtitle: "El Campo de el Usuario No es Válido", style: .warning).show()
        }
        
        if contraseña.isEmpty {
            NotificationBanner(title: "Error", subtitle: "El Campo de la Clave No Puede Estar Vacío", style: .warning).show()
        }
        
        if contraseña.count <= 5 {
            NotificationBanner(title: "Error", subtitle: "La Clave No Puede Ser Menor a 6 Dígitos", style: .warning).show()
        }
        
        ViewModel.postLogin(parameters: LoginStruct.init(email: UsuarioTextField.text!, password: ContraseñaTextField.text!)) { (infologin) in
            
            if infologin?.data != nil {
                
                LoginViewController.loginInfo = infologin
                 let defaults = UserDefaults.standard
                print("el big es \(infologin?.data?.bigcustomer_id)")
                defaults.set(infologin?.data?.bigcustomer_id, forKey: "bigcustomer_id")
                defaults.set(infologin?.data?.bigcustomer_uuid, forKey: "bigcustomer_uuid")
                defaults.set(infologin?.data?.photo_bigcustomer?.url ?? "", forKey: "photo_bigcustomer")
                defaults.set(infologin?.data?.bigcustomer_uuid, forKey: "bigcustomer_uuid")
                defaults.set("\(infologin?.data?.firstname ?? "") \(infologin?.data?.secondname ?? "") \(infologin?.data?.lastname ?? "") \(infologin?.data?.lastname2 ?? "")", forKey: "username")
                defaults.set(infologin?.data?.id, forKey: "id")
                
                self.keychainToken(token: infologin!.data!.token!)
                
                if self.defaults.bool(forKey: "RecordoDato") {
                    
                    self.keyChainSafeData()
                    
                }
                
                self.performSegue(withIdentifier: "showInicio", sender: nil)
                
            }else{
                
                NotificationBanner(title: "Error", subtitle: "No Se Pudo Iniciar Sesión", style: .warning).show()
                
            }
        }
    
    }
    
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.UsuarioTextField:
            self.ContraseñaTextField.becomeFirstResponder()
        case self.ContraseñaTextField:
            self.loginAction()
        default:
            return
        }
    }
    
    private func recoverData() {
        
        if let _ = self.defaults.object(forKey: "RecordoDato") as? Bool {
            
            self.imageRecordar.image = UIImage.init(named: "ic_checkbox_on")
            
            
            let query: [String: Any] = [
                (kSecClass as String): kSecClassInternetPassword,
                (kSecAttrServer as String): "st.fletx.co:5000",
                (kSecAttrAccount as String): self.defaults.string(forKey: "email")!,
                (kSecMatchLimit as String): kSecMatchLimitOne,
                (kSecReturnAttributes as String): true,
                (kSecReturnData as String): true]
            var item: CFTypeRef?
            
            // should succeed
            SecItemCopyMatching(query as CFDictionary, &item) == noErr
            
            if let item = item as? [String: Any],
               let username = item[kSecAttrAccount as String] as? String,
               let passwordData = item[kSecValueData as String] as? Data,
               let password = String(data: passwordData, encoding: .utf8) {
                print("\(username) - \(password)")
                
                self.UsuarioTextField.text = username
                self.ContraseñaTextField.text = password
                
            }
            
        }else{
            
            self.imageRecordar.image = UIImage.init(named: "ic_checkbox_off")
            
        }
        
    }
    
    private func keychainToken(token: String) {
        
        let keyData = token.data(using: .utf8)
                
        let tag = "com.example.key1".data(using: .utf8)
        
        let query = [
          kSecClass: kSecClassKey,
          kSecAttrAccount: self.UsuarioTextField.text!
        ] as CFDictionary

        SecItemDelete(query)
        
            let token = token
            let attributes: [String: Any] = [
                (kSecClass as String): kSecClassKey,
                (kSecAttrApplicationTag as String): tag!,
                (kSecValueData as String): keyData!]
        
            // Let's add the item to the Keychain! 😄
        
        let status = SecItemAdd(attributes as CFDictionary, nil)
        
        print("status \(status) - el token guardado \(token)")
    }
    
    private func keyChainSafeData() {
        
        self.defaults.set(self.UsuarioTextField.text!, forKey: "email")
        
        DeleteKeyChain()
            
            let server = "st.fletx.co:5000"
            let username =  self.defaults.string(forKey: "email") ?? ""
            let password = self.ContraseñaTextField.text!.data(using: .utf8)!
            let attributes: [String: Any] = [
                (kSecClass as String): kSecClassInternetPassword,
                (kSecAttrServer as String): server,
                (kSecAttrAccount as String): username,
                (kSecValueData as String): password]
        
            // Let's add the item to the Keychain! 😄
        
            let status = SecItemAdd(attributes as CFDictionary, nil)
        
        print("status \(status) - \(username) - \(password)")
            
        
    }
    
    private func DeleteKeyChain() {
    
    let query = [
      kSecClass: kSecClassInternetPassword,
      kSecAttrServer: "st.fletx.co:5000",
      kSecAttrAccount: self.defaults.string(forKey: "email") ?? ""
    ] as CFDictionary

    SecItemDelete(query)
    
}
    
    private func switchImage() {
        
        DispatchQueue.main.async(){
            
            
            if let _ = self.defaults.object(forKey: "RecordoDato") as? Bool {
                
                self.DeleteKeyChain()
                self.defaults.set(nil, forKey: "RecordoDato")
                self.defaults.set(nil, forKey: "email")
                self.imageRecordar.image = UIImage.init(named: "ic_checkbox_off")
                
            }else{
                
                self.defaults.set(true, forKey: "RecordoDato")
                self.defaults.set(self.UsuarioTextField.text!, forKey: "email")
                self.imageRecordar.image = UIImage.init(named: "ic_checkbox_on")
                self.keyChainSafeData()
                
            }
            
        }
        
    }
        
    private func switchImageVisibilidad() {
        
        if self.ContraseñaTextField.isSecureTextEntry {
            
            self.VisibilidadOutlet.image = UIImage.init(named: "ic_visibility_on")
            self.ContraseñaTextField.isSecureTextEntry = false
            
        }else{
            
            self.VisibilidadOutlet.image = UIImage.init(named: "ic_visibility_off")
            self.ContraseñaTextField.isSecureTextEntry = true
            
        }
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

func ObtenerToken() -> String {
    let tag = "com.example.key1".data(using: .utf8)
    
    
    let query: [String: Any] = [
        (kSecClass as String): kSecClassKey,
        (kSecAttrApplicationTag as String): tag!,
        (kSecMatchLimit as String): kSecMatchLimitOne,
        (kSecReturnAttributes as String): true,
        (kSecReturnData as String): true]
    
    var item: CFTypeRef?
    
    // should succeed
    SecItemCopyMatching(query as CFDictionary, &item) == noErr
    
    if let item = item as? [String: Any]{
        
        let passwordData = item[kSecValueData as String] as? Data
        let password = String(data: passwordData!, encoding: .utf8)
        print("el token es \(password)")
        
        return password!
    }else{
        return ""
    }
}
