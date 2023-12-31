//
//  StaticsViewController.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import UIKit

/// 통계뷰컨트롤러
final class StaticsViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var backgroundViewCollection: [UIView]!
    @IBOutlet var emotionLabelCollection: [UILabel]!
    @IBOutlet var countLabelCollection: [UILabel]!
    @IBOutlet weak var rightBarButton: UIButton!
    
    typealias ED = EmotionUserDefaults
    // MARK: - Properties
    /// Emotion Cases
    private let emotion: [Emotion] = Emotion.allCases
    
//    private var emotionCounts: [Emotion: Int] = [
//        .veryHappy: ED.VeryHappyIndex.count,
//        .moderateSmile: ED.ModerateSmileIndex.count,
//        .neutral: ED.NeutralIndex.count,
//        .slightlyUpset: ED.SlightlyUpsetIndex.count,
//        .verySad: ED.verySadIndex.count
//    ]
//
//    private func clearEmotion(with emotion: Emotion) {
//        Emotion.clearCount(at: emotion)
//        self.countLabelCollection[emotion.rawValue].text = "\(emotionCounts[emotion] ?? 0)점"
//    }
//
//    private func setEmotionCount(with emotion: Emotion, count: Int) {
//        Emotion.setCount(at: emotion, count: count)
//        self.countLabelCollection[emotion.rawValue].text = "\(emotionCounts[emotion] ?? 0)점"
//    }
//
//
//    private var veryHappy : Int = ED.VeryHappyIndex.count  {
//        didSet {
//            ED.VeryHappyIndex.count = veryHappy
//            self.countLabelCollection[0].text = "\(veryHappy)점"
//        }
//    }
//    private var moderateSmile : Int = ED.ModerateSmileIndex.count  {
//        didSet {
//            ED.ModerateSmileIndex.count = moderateSmile
//            self.countLabelCollection[1].text = "\(moderateSmile)점"
//        }
//    }
//    private var neutral : Int = ED.NeutralIndex.count  {
//        didSet {
//            ED.NeutralIndex.count = neutral
//            self.countLabelCollection[2].text = "\(neutral)점"
//        }
//    }
//    private var slightlyUpset : Int = ED.SlightlyUpsetIndex.count  {
//        didSet {
//            ED.SlightlyUpsetIndex.count = slightlyUpset
//            self.countLabelCollection[3].text = "\(slightlyUpset)점"
//        }
//    }
//    private var verySad : Int = ED.verySadIndex.count  {
//        didSet {
//            ED.verySadIndex.count = verySad
//            self.countLabelCollection[4].text = "\(verySad)점"
//        }
//    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        connectLabel()
//        configPullDownButtonWithMethods()
//        configPullDownButtonDidSet()
        configPullDownButton()
        addObserver()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        veryHappy = ED.VeryHappyIndex.count
//        moderateSmile = ED.ModerateSmileIndex.count
//        neutral = ED.NeutralIndex.count
//        slightlyUpset = ED.SlightlyUpsetIndex.count
//        verySad = ED.verySadIndex.count
//    }
    // MARK: - Private Methods
    /// UI 구성
    private func configUI() {
        backgroundViewCollection.forEach {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
    }
    
    /// 레이블과 UserDefault값 연결
    private func connectLabel() {
        for (index, label) in countLabelCollection.enumerated() {
            // UserDefault값 가져오기
            let count = Emotion.init(rawValue: index)?.getCount
            guard let labelCount = count else { return }
            label.text = "\(String(labelCount))점"
        }
    }
    
    /// 풀다운버튼 구성
    private func configPullDownButton() {
        let firstButton = UIAction(title: "모두 초기화", attributes: .destructive) { _ in
            Emotion.clearAllCount()
        }
        let secondButton = UIAction(title: "완전행복지수 초기화") { _ in
            Emotion.clearCount(at: .veryHappy)
        }
        let thirdButton = UIAction(title: "적당미소지수 초기화") { _ in
            Emotion.clearCount(at: .moderateSmile)
        }
        let fourthButton = UIAction(title: "그냥그냥지수 초기화") { _ in
            Emotion.clearCount(at: .neutral)
        }
        let fifthButton = UIAction(title: "좀속상한지수 초기화") { _ in
            Emotion.clearCount(at: .slightlyUpset)
        }
        let sixthButton = UIAction(title: "많이슬픈지수 초기화") { _ in
            Emotion.clearCount(at: .verySad)
        }
        let buttonMenu = UIMenu(children: [
            firstButton,
            secondButton,
            thirdButton,
            fourthButton,
            fifthButton,
            sixthButton
        ])
        rightBarButton.menu = buttonMenu
    }
    
//    private func configPullDownButtonDidSet() {
//        let firstButton = UIAction(title: "모두 초기화", attributes: .destructive) { [weak self] _ in
//            self?.veryHappy = 0
//            self?.moderateSmile = 0
//            self?.neutral = 0
//            self?.slightlyUpset = 0
//            self?.verySad = 0
//        }
//        let secondButton = UIAction(title: "완전행복지수 초기화") { [weak self] _ in
//            self?.veryHappy = 0
//        }
//        let thirdButton = UIAction(title: "적당미소지수 초기화") { [weak self] _ in
//            self?.moderateSmile = 0
//        }
//        let fourthButton = UIAction(title: "그냥그냥지수 초기화") { [weak self] _ in
//            self?.neutral = 0
//        }
//        let fifthButton = UIAction(title: "좀속상한지수 초기화") { [weak self] _ in
//            self?.slightlyUpset = 0
//        }
//        let sixthButton = UIAction(title: "많이슬픈지수 초기화") { [weak self] _ in
//            self?.verySad = 0
//        }
//        let buttonMenu = UIMenu(children: [
//            firstButton,
//            secondButton,
//            thirdButton,
//            fourthButton,
//            fifthButton,
//            sixthButton
//        ])
//        rightBarButton.menu = buttonMenu
//    }
//    
//    private func configPullDownButtonWithMethods() {
//        let firstButton = UIAction(title: "모두 초기화", attributes: .destructive) { [weak self] _ in
//            Emotion.allCases.forEach {
//                self?.clearEmotion(with: $0)
//            }
//        }
//        let secondButton = UIAction(title: "완전행복지수 초기화") { [weak self] _ in
//            self?.clearEmotion(with: .veryHappy)
//        }
//        let thirdButton = UIAction(title: "적당미소지수 초기화") { [weak self] _ in
//            self?.clearEmotion(with: .moderateSmile)
//        }
//        let fourthButton = UIAction(title: "그냥그냥지수 초기화") { [weak self] _ in
//            self?.clearEmotion(with: .neutral)
//        }
//        let fifthButton = UIAction(title: "좀속상한지수 초기화") { [weak self] _ in
//            self?.clearEmotion(with: .slightlyUpset)
//        }
//        let sixthButton = UIAction(title: "많이슬픈지수 초기화") { [weak self] _ in
//            self?.clearEmotion(with: .verySad)
//        }
//        let buttonMenu = UIMenu(children: [
//            firstButton,
//            secondButton,
//            thirdButton,
//            fourthButton,
//            fifthButton,
//            sixthButton
//        ])
//        rightBarButton.menu = buttonMenu
//    }
    
    /// UserDefault에 addObserver
    private func addObserver() {
        let defaults = UserDefaults.standard
        let keys = EmotionUserDefaults.keyEnum.allCases
        //  "키값"은 유저디폴트 값의 키
        keys.forEach { key in
            defaults.addObserver(self, forKeyPath: key.rawValue, options: .new, context: nil)
        }
    }

    /// Observe Value
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // UserDefaults
        let keys = EmotionUserDefaults.keyEnum.allCases
        guard let keyPath else { return }
        switch keyPath {
        case keys[0].rawValue:
            // UserDefaults값 저장
            let value = UserDefaults.standard.string(forKey: keyPath)
            // 레이블에 값 표시
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
            break
        }
    }
    
    // MARK: - Deinit

    deinit {
        let defaults = UserDefaults.standard
        let keys = EmotionUserDefaults.keyEnum.allCases
        //  "키값"은 유저디폴트 값의 키
        keys.forEach { key in
            defaults.removeObserver(self, forKeyPath: key.rawValue)
        }
    }
    
}


