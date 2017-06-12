//
//  GameScreenViewController.swift
//  Tic Tac Toe
//
//  Created by George Mason on 6/12/17.
//  Copyright © 2017 Griffin Mason. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    //Loading screen for database look up
    //Looks up in database for whether entry had been made for this game name. If not there, then creates new entry with game name and waits for other player to change value in entry to show there are 2 players connected. If entry exists, will check data value to see if other player is connected or if name had been previously used or is being currently used.
    //Game Status is key value. If 0, player waiting for opponent to connect. If 1, both players are connected. If 2, game play finished.
    //First player gets updated when change to data and is taken to VC that lets player choose to go first or second, and X or O
    //Second player to connect has screen change label to "Waiting for other player to choose"
    
    @IBOutlet weak var r1s1: UIImageView!
    @IBOutlet weak var r1s2: UIImageView!
    @IBOutlet weak var r1s3: UIImageView!
    @IBOutlet weak var r2s1: UIImageView!
    @IBOutlet weak var r2s2: UIImageView!
    @IBOutlet weak var r2s3: UIImageView!
    @IBOutlet weak var r3s1: UIImageView!
    @IBOutlet weak var r3s2: UIImageView!
    @IBOutlet weak var r3s3: UIImageView!

    @IBAction func sendMoveButton(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
