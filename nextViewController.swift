//
//  nextViewController.swift
//  hospialmac2
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit


var allTaskNames = [String]()
var allpicname = [String]()
var allTaskIds = [String]()
class nextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTaskNames.count
       // return allpicname.count
        //return allTaskIds.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        let cell = tableview1.dequeueReusableCell(withIdentifier: "cell") as! new1TableViewCell
        cell.text1?.text? = allTaskIds[indexPath.row]
        cell.text2?.text = allpicname[indexPath.row]
        cell.text3.text = allTaskIds[indexPath.row]
       // cell.detailTextLabel?.text = allTaskIds[indexPath.row]
       // cell.detailTextLabel?.text = allpicname[indexPath.row]
        //cell.textLabel?.text = allTaskNames[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func delet4e(_ sender: UIBarButtonItem) {
        
        let edit = storyboard?.instantiateViewController(withIdentifier: "editViewController") as! editViewController

          navigationController?.pushViewController(edit, animated: true
        )
    }
    
    
    @IBOutlet weak var tableview1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let selectQuery = "select Pat_Name,Doc_Name,War_Num from HosTable"
        databaselib.shareObj.selectall(query: selectQuery)
        allTaskNames = databaselib.shareObj.P_Name
        allpicname = databaselib.shareObj.D_Name
        allTaskIds = databaselib.shareObj.W_Num
        tableview1.reloadData()
        print(allTaskNames)
        print(allpicname)
        print(allTaskIds)
        
        // Do any additional setup after loading the view.
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
