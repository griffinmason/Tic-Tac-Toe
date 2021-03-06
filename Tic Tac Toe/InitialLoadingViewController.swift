//
//  InitialLoadingViewController.swift
//  Tic Tac Toe
//
//  Created by George Mason on 6/12/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class InitialLoadingViewController: UIViewController {
    
    var game: DatabaseReference?
    var gamename: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.checkingUpdates()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkingUpdates() {
        let game = Database.database().reference().child("Games").child(gamename!).child("users")
        game.observe(.childChanged, with: { snapshot in
            let title = snapshot
            print("The updated post title is \(title)")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loader")
            self.present(vc!, animated: true, completion: nil)
        })
    }


}
