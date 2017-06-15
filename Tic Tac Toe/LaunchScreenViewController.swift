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
    var gameName : String?
    var portion: DatabaseReference?
    var users: Int?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginButton(_ sender: UIButton) {
        self.users = 1
        if nameLabel.text != nil && gameNameLabel.text != nil {
            let portion = Database.database().reference().child("Games")
            portion.observeSingleEvent(of: .value, with: { (snapshot) in
                if snapshot.hasChild(self.gameNameLabel.text!) {
                    portion.child(self.gameNameLabel.text!).child("users").observe(.value, with: { (snapshot) in
                        let user = snapshot.value as! Int
                        if user == 1 {
                            print ("Updating user count")
                            portion.child(self.gameNameLabel.text!).updateChildValues(["users": 2])
                            self.users = 2
                        }
                    })
                }
            })
            portion.removeAllObservers()
            if self.users == 1 {
                self.makeNewGame()
            }
        }
    }
    
    func makeNewGame() {
        let ref = Database.database().reference()
            NSLog("Button begins to send data to database")
            let id = ref.child("Games").child(gameNameLabel.text!)
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
            let labels = ["users" : 1,
                          "playerTurn" : 2] as [String : Any]
            id.setValue(labels)
            moves.setValue(post)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "navToInitialLoader") {
            let destination: InitialLoadingViewController = segue.destination as! InitialLoadingViewController
            destination.gamename = gameName
        }
    }
}




    
    


