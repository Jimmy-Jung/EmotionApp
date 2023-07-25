//
//  ViewController.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import UIKit
import SnapKit

class EmotionViewController: UIViewController {
    @IBOutlet var emotionButtonCollection: [UIButton]!
    let emotion: [Emotion] = [.veryHappy, .moderateSmile, .neutral, .slightlyUpset, .verySad]
    var countLabelCollection: [UILabel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
    }
    
    
    
    private func configLabel() {
        for _ in 1...emotion.count {
            let label = UILabel()
            label.backgroundColor = .clear
            label.textColor = .clear
            label.frame.size.width = 50
            label.frame.size.height = 50
            label.text = "+0"
            label.font = UIFont.boldSystemFont(ofSize: 25)
            label.layer.cornerRadius = 10
            label.clipsToBounds = true
            countLabelCollection.append(label)
        }
        
        for (index, label) in countLabelCollection.enumerated() {
            self.view.addSubview(label)
            label.snp.makeConstraints { make in
                make.centerX
                    .equalTo(emotionButtonCollection[index].snp.centerX)
                    .offset(view.frame.width / 3)
                make.centerY.equalTo(emotionButtonCollection[index].snp.centerY)
            }
        }
        
        
    }
    
    
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let emt = emotion[sender.tag]
        let label = countLabelCollection[sender.tag]
        
        emt.addCount(1)
        UIView.transition(
            with: label,
            duration: 0.3,
            options: [.transitionCrossDissolve, .curveEaseIn]
        ) {
            label.text = "+\(emt.getCount)"
            if sender.tag == 2 {
                label.textColor = .systemGray
            } else {
                label.textColor = .white
            }
        } completion: {_ in
            UIView.transition(
                with: label,
                duration: 0.3,
                options: [.transitionCrossDissolve, .curveEaseOut]
            ) {
                label.textColor = .clear
            }
        }
        
        
        
    }
    
}

