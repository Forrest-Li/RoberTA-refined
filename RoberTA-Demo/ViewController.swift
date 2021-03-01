//
//  ViewController.swift
//  RoberTA-Demo
//
//  Created by ForrestLi on 2021/2/28.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var testText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var ref: DatabaseReference!
        var username = ""
        ref = Database.database(url: "https://roberta-5eb35-default-rtdb.firebaseio.com/").reference()
        
        let userID = Auth.auth().currentUser?.uid //"qEhesKr1knRV85cenFKnXxVchT43"
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            username = value?["root/exams"] as? String ?? ""
            

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
        
        print("below")
        print(username)
        print("above")
        self.testText.text = "below"+username+"above"
    }

}

