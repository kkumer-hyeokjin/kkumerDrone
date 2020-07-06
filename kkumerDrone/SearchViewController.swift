//
//  SearchViewController.swift
//  kkumerDrone
//
//  Created by 박혁진 on 2020/06/19.
//  Copyright © 2020 kkumercompany. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtField.becomeFirstResponder()
        txtField.backgroundColor = UIColor.white
        txtField.returnKeyType = UIReturnKeyType.search
        txtField.enablesReturnKeyAutomatically = true
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        print("action touchButton")
        self.presentingViewController?.dismiss(animated: true)
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
