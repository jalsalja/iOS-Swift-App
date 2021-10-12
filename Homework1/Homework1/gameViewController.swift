//
//  gameViewController.swift
//  Homework1
//
//  Created by Anna HAn on 9/7/20.
//  Copyright © 2020 Boise State. All rights reserved.
//

import UIKit
import GameplayKit

class gameViewController: UIViewController {
    
    let randomSource = GKARC4RandomSource.self
    
    
    @IBOutlet var computerImageView: UIImageView!
    
    @IBOutlet var playerImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapStart(_ sender: UIButton) {
        computerImageView.image = UIImage(named: "rock.png")
        playerImageView.image = UIImage(named: "rock.png")
        messageLabel.text = "Rock Scissor Paper"
    }
    
    
    
    @IBAction func rockBtn() {
        playerImageView.image = UIImage(named: "rock.png")
        computerPlay(player: 1)
    }
    
    
    @IBAction func scissorBtn() {
        playerImageView.image = UIImage(named: "scissor.png")
        computerPlay(player: 0)
    }
    
    
    @IBAction func paperBtn() {
        playerImageView.image = UIImage(named: "paper.png")
        computerPlay(player: 2)
    }
    
    
    func computerPlay(player: Int){
        let computerWork = randomSource.sharedRandom().nextInt(upperBound: 3)
        var message = ""
        switch computerWork {
            case 0:
            //scissor
            computerImageView.image = UIImage(named: "scissor.png")
                switch player {
                    case 0: //scissor
                        message = "Even"
                    case 1: //rock
                        message =  "Win"
                    case 2: //paper
                        message = "Lost"
                    default:
                        break
                }
            case 1: //rock
                computerImageView.image = UIImage(named: "rock.png")
                switch player {
                    case 0: //scissor
                        message = "Lost"
                    case 1: //rock
                        message =  "Even"
                    case 2: //paper
                        message = "Win"
                    default:
                        break
                }
            case 2: //paper
                computerImageView.image = UIImage(named:"paper.png")
                switch player {
                    case 0: //scissor
                        message = "Win"
                    case 1: //rock
                        message =  "Lost"
                    case 2: //paper
                        message = "Even"
                    default:
                        break
                }
                default:
                    break
            }
        messageLabel.text = message
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
