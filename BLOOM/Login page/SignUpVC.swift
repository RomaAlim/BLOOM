//
//  SignUpVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 10.04.2023.
//

import UIKit
import Firebase

class SignUpVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        ViewCornerRadious()

    }
    
    @IBOutlet weak var PasswordTextFiled: UITextField!
    @IBOutlet weak var LoginTextFiled: UITextField!
    @IBOutlet weak var NameTextFiled: UITextField!
    @IBOutlet weak var SubmutButtonRad: UIButton!
    @IBOutlet weak var CreateAccountRad: UILabel!
    @IBOutlet weak var ViewCorner: UIView!
    func ViewCornerRadious(){
        ViewCorner.layer.cornerRadius = 20
        ViewCorner.clipsToBounds = true
        CreateAccountRad.layer.cornerRadius = 10
        SubmutButtonRad.layer.cornerRadius = 10
    }


    @IBAction func SubmitButton(_ sender: UIButton) {
        let name = NameTextFiled.text!
        let email = LoginTextFiled.text!
        let password = PasswordTextFiled.text!
        
        if password.count < 6{
            alertErrorPassword()
            return
        }
        if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil {
                        if let result = result {
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")
                            let userData: [String: Any] = ["name": name, "email": email, "role": "user"]
                            ref.child(result.user.uid).setValue(userData) { error, _ in
                                if error == nil {
                                    self.dismiss(animated: true, completion: nil)
                                    self.register()
                                } else {
                                    // Handle error while setting user data
                                }
                            }
                        }
                    } else {
                        // Handle error during user creation
                    }
                }
            } else {
                alertError()
            }
        

        navigationController?.popViewController(animated: true)
    }
    func register() {
        // Получите значения электронной почты и пароля из текстовых полей
        let email = LoginTextFiled.text!
        let password = PasswordTextFiled.text!
        
        // Сохраните значения в UserDefaults
        UserDefaults.standard.set(email, forKey: "registeredEmail")
        UserDefaults.standard.set(password, forKey: "registeredPassword")
        
        // Другой код для регистрации пользователя в Firebase
        // ...
    }

    func alertError(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func alertErrorPassword(){
        let alert = UIAlertController(title: "Ошибка", message: "Пароль должен содержать более 6 символов!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

