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
        configUI()
        connectLabel()
    }
    
    private func configUI() {
        backgroundViewCollection.forEach {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
    }
    
    private func connectLabel() {
        for (index, label) in countLabelCollection.enumerated() {
            let count = Emotion.init(rawValue: index)?.getCount
            guard let labelCount = count else { return }
            label.text = "\(String(labelCount))점"
        }
        
    }
    @IBAction func pullDownTapped(_ sender: UIBarButtonItem) {
    }
    

}
