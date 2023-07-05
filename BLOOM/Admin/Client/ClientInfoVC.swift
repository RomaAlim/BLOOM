//
//  ClientInfoVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

class ClientInfoVC: UIViewController {

    var segueFullName = ""
    var segueAddress = ""
    var seguePhoneNumber = ""
    var segueAddinfo = ""
    var segueId = ""
    
    @IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addInfoLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = segueFullName
        phoneNumberLabel.text = seguePhoneNumber
        addressLabel.text = segueAddress
        addInfoLabel.text = segueAddinfo
    }
    


    @IBAction func DeleteButtonAction(_ sender: Any) {
        // Создание предупреждающего уведомления (alert)
            let alert = UIAlertController(title: "Удаление клиента", message: "Вы точно хотите удалить клиента?", preferredStyle: .alert)

            // Добавление кнопки "Cancel" (отмена)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            // Добавление кнопки "Delete" (удаление)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                // Создание URL для удаления клиента по его уникальному идентификатору (segueId)
                guard let deleteURL = URL(string: "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Clients/\(self.segueId)") else {
                    return
                }

                var request = URLRequest(url: deleteURL)
                request.httpMethod = "DELETE"

                let task = URLSession.shared.dataTask(with: request) { [weak self] (_, response, error) in
                    guard let self = self else { return }

                    if let error = error {
                        print("Error executing the request: \(error)")
                        return
                    }

                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            // Успешное удаление
                            DispatchQueue.main.async {
                                // Отобразить сообщение об успешном удалении
                                let successAlert = UIAlertController(title: "Успех", message: "Клиент успешно удален", preferredStyle: .alert)
                                successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                                    // Перейти на предыдущий экран или выполнить другие необходимые действия
                                    self.BackMenu()
                                }))
                                self.present(successAlert, animated: true, completion: nil)
                            }
                        } else {
                            // Обработка ошибки удаления
                            DispatchQueue.main.async {
                                let errorAlert = UIAlertController(title: "Ошибка", message: "Произошла ошибка при удалении клиента", preferredStyle: .alert)
                                errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                self.present(errorAlert, animated: true, completion: nil)
                            }
                        }
                    }
                }

                task.resume()
            }))

            // Отображение предупреждающего уведомления
            present(alert, animated: true, completion: nil)
    }
    
    func BackMenu(){
        if let viewControllers = self.navigationController?.viewControllers {
            guard viewControllers.count >= 3 else {
                // Нет ViewController'ов для возврата
                return
            }
            let destinationVC = viewControllers[viewControllers.count - 3]
            self.navigationController?.popToViewController(destinationVC, animated: true)
        }
    }
    

}
