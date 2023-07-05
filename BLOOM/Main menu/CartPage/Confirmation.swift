//
//  Confirmation.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 28.04.2023.
//

import UIKit

class Confirmation: UIViewController{
    
    @IBOutlet weak var AddressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func BackButton(_ sender: Any) {

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
