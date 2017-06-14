//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by George Mason on 6/9/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var gameNameLabel: UITextField!
    
    var ref : DatabaseReference?
    var moves : DatabaseReference?
    var id : DatabaseReference?
    var post : [String:Int] = [:]
    var labels: [String: AnyObject] = [:]
    var check : DatabaseReference?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginButton(_ sender: UIButton) {
        //let check = Database.database().reference().child("Games")
        let check = Database.database().reference().child("Games").queryEqual(toValue: gameNameLabel.text, childKey: "game_name")
        
        /*check.observe(.value, with: { (snapshot: DataSnapshot) in
            for snap in snapshot.children {
                print((snap as! DataSnapshot).key)
            }
        },
 */
        //makeNewGame()
    }
    
    func makeNewGame() {
        let ref = Database.database().reference()
        if nameLabel.text != nil && gameNameLabel.text != nil {
            NSLog("Button begins to send data to database")
            let id = ref.child("Games").childByAutoId()
            let moves = id.child("moves")
            let post = ["1":2,
                        "2":2,
                        "3":2,
                        "4":2,
                        "5":2,
                        "6":2,
                        "7":2,
                        "8":2,
                        "9":2] as [ String : Int ]
            let labels = ["game_name":gameNameLabel.text as Any,
                          "users" : 1,
                          "playerTurn" : 2] as [String : Any]
            id.setValue(labels)
            moves.setValue(post)
        }
    }
}



    
    


