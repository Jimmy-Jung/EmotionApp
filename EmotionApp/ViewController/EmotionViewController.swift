//
//  ViewController.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import UIKit
import SnapKit

/// 이모션뷰컨트롤러
final class EmotionViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var emotionButtonCollection: [UIButton]!
    
    // MARK: - Properties
    private let emotion: [Emotion] = Emotion.allCases
    private var countLabelCollection: [UILabel] = []
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
        configPullDownButton()
    }
    // MARK: - Private Methods
    /// 레이블 구성
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
        // 터치 횟수에 따라 표시해줄 레이블 구성
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
    
    /// 풀다운 버튼 구성
    private func configPullDownButton() {
        for (index, button) in emotionButtonCollection.enumerated() {
            let emt = emotion[index]
            let label = countLabelCollection[index]
            let resetButton = UIAction(title: "모두 초기화", attributes: .destructive) { _ in
                Emotion.clearAllCount()
            }
            let firstButton = UIAction(title: "+1") { [weak self] _ in
                emt.addCount(1)
                self?.animateCountLabel(to: label, count: emt.getCount, index: index)
            }
            let secondButton = UIAction(title: "+5") { [weak self] _ in
                emt.addCount(5)
                self?.animateCountLabel(to: label, count: emt.getCount, index: index)
            }
            let thirdButton = UIAction(title: "+10") { [weak self] _ in
                emt.addCount(10)
                self?.animateCountLabel(to: label, count: emt.getCount, index: index)
            }
            let buttonMenue = UIMenu(children: [
                resetButton,
                firstButton,
                secondButton,
                thirdButton])
            button.menu = buttonMenue
        }
    }
    
    /// 카운트 레이블 트랜지션 효과 메서드
    /// - Parameters:
    ///   - label: 효과 줄 레이블
    ///   - count: 표시해줄 숫자
    ///   - index: 레이블 컬렉션 중 몇번 째 레이블
    private func animateCountLabel(to label: UILabel, count: Int, index: Int) {
        UIView.transition(
            with: label,
            duration: 0.3,
            options: [.transitionCrossDissolve, .curveEaseIn]
        ) {
            label.text = "+\(count)"
            if index == 2 {
                label.textColor = .systemGray
            } else {
                label.textColor = .white
            }
        } completion: { _ in
            UIView.transition(
                with: label,
                duration: 0.3,
                options: [.transitionCrossDissolve, .curveEaseOut]
            ) {
                label.textColor = .clear
            }
        }
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        let emt = emotion[sender.tag]
        let label = countLabelCollection[sender.tag]
        emt.addCount(1)
        animateCountLabel(to: label, count: emt.getCount, index: sender.tag)
    }
}

