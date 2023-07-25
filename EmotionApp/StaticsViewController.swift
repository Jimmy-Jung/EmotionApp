//
//  StaticsViewController.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import UIKit

class StaticsViewController: UIViewController {
    @IBOutlet var backgroundViewCollection: [UIView]!
    @IBOutlet var emotionLabelCollection: [UILabel]!
    @IBOutlet var countLabelCollection: [UILabel]!
    @IBOutlet weak var pullDownButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pullDownTapped(_ sender: UIBarButtonItem) {
    }
    

}
