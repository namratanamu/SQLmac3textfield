//
//  databaselib.swift
//  hospialmac2
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import Foundation
import SQLite3
class databaselib
{
    static let shareObj = databaselib()
    var P_Name = [String]()
    var D_Name = [String]()
    var W_Num = [String]()
    func databasePath() -> String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path+"myDatabase.sqlite"
    }
    func executeQuery(query:String) ->Bool
    {
        var success: Bool = false
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                if sqlite3_step(stmt) == SQLITE_DONE
                {
                    success = true
                    sqlite3_finalize(stmt)
                    sqlite3_close(db)
                }
                    
                else
                {
                    print("error in step:\(sqlite3_errmsg(stmt))")
                }
            }
            else
            {
                print("error in prepare:\(sqlite3_errmsg(stmt))")
            }
        }
        else
        {
            print("error in Open:\(sqlite3_errmsg(stmt))")
        }
        return success
    }
    func selectall(query:String)
    {
        
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                P_Name.removeAll()
                D_Name.removeAll()
                W_Num.removeAll()
                while sqlite3_step(stmt) == SQLITE_ROW
                {
                    let pname = sqlite3_column_text(stmt, 0)
                    let patname = String(cString: pname!)
                   P_Name.append(patname)
                    let  dname = sqlite3_column_text(stmt, 1)
                    let docname = String(cString:dname!)
                  D_Name .append(docname)
                    let wno = sqlite3_column_text(stmt, 2)
                    let wordnum = String(cString:wno!)
                    W_Num.append(wordnum)
                }
                print(W_Num)
            }
                
            else
            {
                print("error in prepare:\(sqlite3_errmsg(stmt))")
            }
        }
        else
        {
            print("error in Open:\(sqlite3_errmsg(stmt))")
        }
        
    }
    func createTable()
    {
        let createQuery = "create table if not exists HosTable(Pat_Name text,Doc_Name text,War_Num text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
            
        {
            print("table creation:success")
            
        }
        else{
            print("table creation:failed")
        }
    }
}
