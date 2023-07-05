//
//  LoginMenuVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 10.04.2023.
//

import UIKit
import Firebase
import LocalAuthentication

class LoginMenuVC: UIViewController{
             
        @IBOutlet weak var LoginText: UITextField!
        @IBOutlet weak var PassText: UITextField!
        @IBOutlet weak var LabelText: UILabel!

        override func viewDidLoad() {
            super.viewDidLoad()

        }
        
        @IBAction func FaceId(_ sender: Any) {
            authenticateWithBiometrics()
        }
        
        @IBAction func LogButton(_ sender: Any) {
            self.GoToMain()
            //login()
        }

    @IBAction func SignUpAction(_ sender: Any) {
        goToSignUpPage()
    }
    
    // Функция FaceID:
    func authenticateWithBiometrics() {
           let context = LAContext()
           var error: NSError?
           
           if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
               let reason = "Авторизация с помощью Face ID/Touch ID"
               
               context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                   DispatchQueue.main.async {
                       if success {
                           self?.fillLoginFields()
                           self?.login()
                       } else {
                           // Handle authentication failure
                           if let error = authenticationError as? LAError {
                               let errorMessage: String
                               switch error.code {
                               case .appCancel:
                                   errorMessage = "Аутентификация отменена приложением"
                               case .userCancel:
                                   errorMessage = "Аутентификация отменена пользователем"
                               case .userFallback:
                                   errorMessage = "Выбрано другое аутентификационное средство"
                               default:
                                   errorMessage = "Ошибка аутентификации"
                               }
                               
                               self?.showAuthenticationError(message: errorMessage)
                           }
                       }
                   }
               }
           } else {
               // Device does not support biometric authentication or biometrics are not set up
               let errorMessage = "Биометрическая аутентификация не поддерживается или не настроена на устройстве"
               showAuthenticationError(message: errorMessage)
           }
       }
    func fillLoginFields() {
        // Получите сохраненные значения электронной почты и пароля из UserDefaults
        if let email = UserDefaults.standard.string(forKey: "registeredEmail"),
           let password = UserDefaults.standard.string(forKey: "registeredPassword") {
            // Заполните поля электронной почты и пароля
            LoginText.text = email
            PassText.text = password
        }
    }



    
    // Функция входа:
    func login() {
        let login = LoginText.text!
        let password = PassText.text!
        if !login.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: login, password: password) { (result, error) in
                if error == nil {
                    let userId = result?.user.uid ?? ""
                    let ref = Database.database().reference().child("users").child(userId)
                    ref.observeSingleEvent(of: .value) { snapshot in
                        if let userData = snapshot.value as? [String: Any],
                           let userRole = userData["role"] as? String {
                            if userRole == "admin" {
                                self.adminPage()
                            } else {
                                self.GoToMain()
                            }
                        } else {
                            self.alertErrorSignIN()
                        }
                    }
                } else {
                    self.alertErrorSignIN()
                }
            }
        } else {
            alertErrorField()
        }
    }
    // Ошибки alert:
    func showAuthenticationError(message: String) {
        let alert = UIAlertController(title: "Ошибка аутентификации", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func alertErrorField(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func alertErrorSignIN(){
        let alert = UIAlertController(title: "Ошибка", message: "Неверный адрес электронной почты или пароль!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    // Переходы на экраны:
    func GoToMain()  {
        let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "TabBarID") as! UITabBarController // delete
        tabBarController.selectedIndex = 0 // Индекс нужного ViewController на TabBar// delete
        self.navigationController?.pushViewController(tabBarController, animated: true)// delete
    }
    func goToSignUpPage() {
         guard let signUpVC = UIStoryboard(name: "Main", bundle: nil)
                 .instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC else { return }
         navigationController?.pushViewController(signUpVC, animated: true)
     }
    func adminPage() {
        let viewController = UIStoryboard(name: "AdminMainSB", bundle: nil).instantiateViewController(withIdentifier: "AdminPageVC") as! AdminMainVC
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
