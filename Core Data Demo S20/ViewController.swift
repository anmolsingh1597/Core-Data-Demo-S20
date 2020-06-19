//
//  ViewController.swift
//  Core Data Demo S20
//
//  Created by Anmol singh on 2020-06-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        // 1 Step -  we need to have instance of app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // 2 Step - we need to create our context
        let context = appDelegate.persistentContainer.viewContext
//
//        //3 Step - write to coreData
//        let newContact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: context)
//
//        // add data into context
//        newContact.setValue("Raghav", forKey: "firstName")
//        newContact.setValue("Bobal", forKey: "lastName")
//        newContact.setValue(30, forKey: "age")
//        newContact.setValue("raghav@anmol.com", forKey: "email")
//
//        //4 Step - Save data to coreData
//        do{
//            try context.save()
//        }catch{
//            print(error)
//        }
//
//
        //fetch data from coreData
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contact")
        
        // using NSPredicate to narrow our query
//        request.predicate = NSPredicate(format: "firstName=[cd]%@", "AnmolSingh")
//        request.predicate = NSPredicate(format: "firstName CONTAINS [cd]%@", "AnmolSingh")
//        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let fName = result.value(forKey: "firstName"){
                    print(fName)
                    let firstName = fName as! String
                        print(firstName)
//                        if firstName == "Anmol" {
//                            //update Coredata
//                            result.setValue("AnmolSingh", forKey: "firstName")
//                            do {
//                                try context.save()
//                            } catch  {
//                                print(error)
//                            }
//                        }
                        
                        
    // delete the record
//        context.delete(result)
                    }
                    if let email = result.value(forKey: "email"){
                                     print(email)
                        
                        let email = email as! String
//                        let newEmail = email.replacingOccurrences(of: "an.ca", with: "myLambton")
//                        result.setValue(newEmail, forKey: "email")
//                        result.setValue(email.dropLast(3) + "anmol.ca", forKey: "email")
                                     }
//                    do {
//                            try context.save()
//                    } catch  {
//                            print(error)
//                        }
//
//
     
                }
            }
        } catch  {
            print(error)
        }
    }


}

