//
//  ListProductVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

class ListProductVC: UIViewController {

    
    @IBOutlet weak var Table: UITableView!
    var position = 0
    var ProductList:[ProductFull] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.delegate = self
        Table.register(UINib(nibName: "DeleteTVCell", bundle: nil), forCellReuseIdentifier: "DeleteTVCell")
        
        let network = NetworkAL() // Alamifire
        network.DecoderAL { responseData in // Alamifire
            for product in responseData { // Alamifire
                self.ProductList.append(product) // Alamifire
            } // Alamifire
            self.Table.reloadData() // Reload table data to display the new products // Alamifire
        } // Alamifire
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.Table.reloadData()
        
    }


}
extension ListProductVC:UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableProduct = ProductList[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "DeleteTVCell", for: indexPath) as! DeleteTVCell
        cell.delegate = self
        cell.brandCell.text = TableProduct.Brand
        cell.costCell.text = TableProduct.Cost
        cell.typeProductCell.text = TableProduct.TypeProduct
        cell.imageCell.image = nil

        if let imageURL = TableProduct.imageURL {
            TableProduct.loadImage(from: imageURL) { image in
                DispatchQueue.main.async {
                    cell.imageCell.image = image
                }
            }
        }

        return cell
    }


    
}

extension ListProductVC: DeleteTVCellDelegate {
    func didTapDeleteButton(cell: DeleteTVCell) {
        guard let indexPath = Table.indexPath(for: cell) else { return }
        let product = ProductList[indexPath.row]

        // Создание предупреждающего уведомления (alert)
        let alert = UIAlertController(title: "Удаление продукта", message: "Вы точно хотите удалить продукт из базы?", preferredStyle: .alert)

        // Добавление кнопки "Cancel" (отмена)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Добавление кнопки "Delete" (удаление)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            // Создание URL для удаления продукта по его уникальному идентификатору
            guard let deleteURL = URL(string: "https://64455764b80f57f581b7e94f.mockapi.io/api/v1/Products/\(product.id)") else {
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
                        // Удалить продукт из массива ProductList и обновить таблицу
                        self.ProductList.remove(at: indexPath.row)
                        DispatchQueue.main.async {
                            self.Table.reloadData()
                        }
                    } else {
                        // Обработка ошибки удаления при необходимости
                    }
                }
            }

            task.resume()
        }))

        // Отображение предупреждающего уведомления
        present(alert, animated: true, completion: nil)
    }

}


