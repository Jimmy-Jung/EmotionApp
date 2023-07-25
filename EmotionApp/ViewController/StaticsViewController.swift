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
    @IBOutlet weak var rightBarButton: UIButton!
    let emotion: [Emotion] = Emotion.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        connectLabel()
        configPullDownButton()
        addObserver1()
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
    
    private func configPullDownButton() {
        let firstButton = UIAction(title: "점수 초기화", attributes: .destructive) { _ in
            Emotion.clearAllCount()
            self.view.layoutIfNeeded()
        }
        let secondButton = UIAction(title: "완전행복지수 초기화") { _ in
            Emotion.clearCount(at: .veryHappy)
            self.view.layoutIfNeeded()
        }
        let thirdButton = UIAction(title: "적당미소지수 초기화") { _ in
            Emotion.clearCount(at: .moderateSmile)
            self.view.layoutIfNeeded()
        }
        let fourthButton = UIAction(title: "그냥그냥지수 초기화") { _ in
            Emotion.clearCount(at: .neutral)
            self.view.layoutIfNeeded()
        }
        let fifthButton = UIAction(title: "좀속상한지수 초기화") { _ in
            Emotion.clearCount(at: .slightlyUpset)
            self.view.layoutIfNeeded()
        }
        let sixthButton = UIAction(title: "많이슬픈지수 초기화") { _ in
            Emotion.clearCount(at: .verySad)
            self.view.layoutIfNeeded()
        }
        
        let buttonMenue = UIMenu(children: [
            firstButton,
            secondButton,
            thirdButton,
            fourthButton,
            fifthButton,
            sixthButton
        ])
        rightBarButton.menu = buttonMenue
    }
    
    
    private func addObserver1() {
        let defaults = UserDefaults.standard
        let keys = EmotionUserDefaults.keyEnum.allCases
        //  "키값"은 유저디폴트 값의 키
        keys.forEach { key in
            defaults.addObserver(self, forKeyPath: key.rawValue, options: .new, context: nil)
        }
        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let keys = EmotionUserDefaults.keyEnum.allCases
        guard let keyPath else { return }
        switch keyPath {
        case keys[0].rawValue:
            let value = UserDefaults.standard.string(forKey: keyPath)
            self.countLabelCollection[0].text = "\(value!)점"
        case keys[1].rawValue:
            let value = UserDefaults.standard.string(forKey: keyPath)
            self.countLabelCollection[1].text = "\(value!)점"
        case keys[2].rawValue:
            let value = UserDefaults.standard.string(forKey: keyPath)
            self.countLabelCollection[2].text = "\(value!)점"
        case keys[3].rawValue:
            let value = UserDefaults.standard.string(forKey: keyPath)
            self.countLabelCollection[3].text = "\(value!)점"
        case keys[4].rawValue:
            let value = UserDefaults.standard.string(forKey: keyPath)
            self.countLabelCollection[4].text = "\(value!)점"
        default:
            print("디폴트")
            break
        }
    }
    
    @IBAction func rightBarButtonTapped(_ sender: UIButton) {
    }
    
    
    deinit {
        let defaults = UserDefaults.standard
        let keys = EmotionUserDefaults.keyEnum.allCases
        //  "키값"은 유저디폴트 값의 키
        keys.forEach { key in
            defaults.removeObserver(self, forKeyPath: key.rawValue)
        }
    }
    
}
