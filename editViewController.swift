//
//  editViewController.swift
//  hospialmac2
//
//  Created by Felix 05 on 04/10/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class editViewController: UIViewController {

    var eid = String()
    var enam = String()
    var ename = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EditId.text = eid
        EditName.text = ename
        Editnew.text = enam
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var EditId: UITextField!
    
    @IBOutlet weak var EditName: UITextField!
    
    
    
    @IBOutlet weak var Editnew: UITextField!
  
    @IBAction func deleten(_ sender: UIButton) {
    
        let DeleteQuery = "delete from  HosTable where  = '\(EditId.text!)'"
        let issuccess = databaselib.shareObj.executeQuery(query:DeleteQuery )
        if issuccess
        {
            print("Delete success")
        }
        else
        {
            print("Delete failed")
        }
        
        
    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
