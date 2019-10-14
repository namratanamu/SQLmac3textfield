//
//  ViewController.swift
//  hospialmac2
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBOutlet weak var patient_Name: UITextField!
    
    
    @IBOutlet weak var doctor_Name: UITextField!
    
    
    
    @IBOutlet weak var ward_no: UITextField!
    
    
    
    @IBAction func insertdata(_ sender: UIButton) {
        //        let createQuery = "create table if not exists hospitalTable(P_Name text,D_Name text,Ward_Num text)"

        let insertQuery = "insert into HosTable(Pat_Name,Doc_Name,War_Num) values ('\(patient_Name.text!)','\(doctor_Name.text!)','\(ward_no.text!)')"
        let issuccess = databaselib.shareObj.executeQuery(query:insertQuery )
        if issuccess
        {
            print("insert success")
        }
        else
        {
            print("insert failed")
        }
    
    }
    
    
    @IBAction func savedata(_ sender: UIButton) {
    
        let next = storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        
        navigationController?.pushViewController(next, animated: true)
    }
    
    
    
   
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

