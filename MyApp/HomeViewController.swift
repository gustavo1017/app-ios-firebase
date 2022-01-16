//
//  HomeViewController.swift
//  MyApp
//
//  Created by Hector Fernando Quispe Ramos on 15/01/22.
//

import UIKit
import Firebase
import FirebaseAuth

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {
    
    

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cerrarSesionboton: UIButton!
    @IBOutlet weak var providerLabel: UILabel!
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Inicio"
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
    
    @IBAction func cerrarSesionBotonAccion(_ sender: Any) {
        switch provider {
        case .basic:
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                // se ha producido un error
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
