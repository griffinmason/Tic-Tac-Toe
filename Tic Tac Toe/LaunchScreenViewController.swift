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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func beginButton(_ sender: UIButton) {
        let gameName = gameNameLabel.text
        if nameLabel.text != nil && gameNameLabel.text != nil {
            print (gameName)
            let portion =  Database.database().reference().child("Games")
            portion.observeSingleEvent(of: .value, with: { snapshot in
                print("is this working")
                if snapshot.hasChild(gameName!) {
                    print("Hello I exist")
                    let check = portion.child(gameName!)
                    check.updateChildValues(["users":2])
                } else {
                    print("Making new game")
                    self.makeNewGame()
                }
            })
            /*Database.database().reference().child("Games").queryOrdered(byChild: "game_name").queryEqual(toValue: gameNameLabel.text).observe(.value, with: {
                (snapshot) in
                if snapshot.exists(){
                    print("I exist")
                    self.updateUsers()
                    
                } else {
                    print("I don't exist yet")
                    self.makeNewGame()
                }
            }
            )*/
        }
    }
        //let check = Database.database().reference().child("Games").queryEqual(toValue: gameNameLabel.text, childKey: "game_name")
        //check.updateChildValues(["playerTurn" : 2])
        /*check.observe(.value, with: { (snapshot: DataSnapshot) in
            for snap in snapshot.children {
                print((snap as! DataSnapshot).key)
            }
        },
 */
        //makeNewGame()

    
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
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "navToInitialLoader") {
            let destination: InitialLoadingViewController = segue.destination as! InitialLoadingViewController
            destination.gamename = gameName
        }
    }
    */
}




    
    


