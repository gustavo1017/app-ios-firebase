//
//  ViewController.swift
//  MyApp
//
//  Created by Hector Fernando Quispe Ramos on 15/01/22.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var recuperarTextField: UITextField!
    @IBOutlet weak var registrarBoton: UIButton!
    @IBOutlet weak var iniciarBoton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Autenticacion"
    }
    
    @IBAction func registrarAccion(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    @IBAction func iniciarAccion(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func recuperarClave(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: recuperarTextField.text!) {
            (error) in
            if self.recuperarTextField.text?.isEmpty==true{
                let resetFailedAlert = UIAlertController(title: "Reset Failed", message: "Error: dadasassa", preferredStyle: .alert)
                resetFailedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetFailedAlert, animated: true, completion: nil)
            }
            if error != nil && self.recuperarTextField.text?.isEmpty==false{
                let resetEmailAlertSent = UIAlertController(title: "Reset Email Sent", message: "Reset email has been sent to your login email, please follow the instructions in the mail to reset your password", preferredStyle: .alert)
                resetEmailAlertSent.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(resetEmailAlertSent, animated: true, completion: nil)
            }
        }
        
    }
    
    

}

