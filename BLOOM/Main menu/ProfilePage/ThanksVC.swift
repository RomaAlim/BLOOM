//
//  ThanksVC.swift
//  BLOOM
//
//  Created by Ramazan Kalabay on 17.05.2023.
//

import UIKit

class ThanksVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func GoBackButton(_ sender: Any) {
        if let viewControllers = self.navigationController?.viewControllers {
            guard viewControllers.count >= 3 else {
                // Нет ViewController'ов для возврата
                return
            }
            let destinationVC = viewControllers[viewControllers.count - 3]
            self.navigationController?.popToViewController(destinationVC, animated: true)
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
