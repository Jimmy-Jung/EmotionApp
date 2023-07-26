//
//  EmotionManager.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import Foundation


/// 이모션 UserDefault 값 다루기
enum Emotion: Int, CaseIterable {
    case veryHappy = 0
    case moderateSmile
    case neutral
    case slightlyUpset
    case verySad
    
    // MARK: - Static Methods
    /// UserDefault 값 초기화
    /// - Parameter emotion: 초기화 할 Emotion
    @discardableResult
    static func clearCount(at emotion: Self) -> Int{
        switch emotion {
        case .veryHappy:
            EmotionUserDefaults.VeryHappyIndex.count = 0
        case .moderateSmile:
            EmotionUserDefaults.ModerateSmileIndex.count = 0
        case .neutral:
            EmotionUserDefaults.NeutralIndex.count = 0
        case .slightlyUpset:
            EmotionUserDefaults.SlightlyUpsetIndex.count = 0
        case .verySad:
            EmotionUserDefaults.verySadIndex.count = 0
        }
        return 0
    }
    
    /// UserDefaults 모든 값 초기화
    static func clearAllCount() {
        EmotionUserDefaults.VeryHappyIndex.count = 0
        EmotionUserDefaults.ModerateSmileIndex.count = 0
        EmotionUserDefaults.NeutralIndex.count = 0
        EmotionUserDefaults.SlightlyUpsetIndex.count = 0
        EmotionUserDefaults.verySadIndex.count = 0
    }
    
    /// UserDefault 값 설정
    /// - Parameters:
    ///   - emotion: Emotion Type
    ///   - count: 설정해줄 값
    static func setCount(at emotion: Self, count: Int) {
        switch emotion {
        case .veryHappy:
            EmotionUserDefaults.VeryHappyIndex.count = count
        case .moderateSmile:
            EmotionUserDefaults.ModerateSmileIndex.count = count
        case .neutral:
            EmotionUserDefaults.NeutralIndex.count = count
        case .slightlyUpset:
            EmotionUserDefaults.SlightlyUpsetIndex.count = count
        case .verySad:
            EmotionUserDefaults.verySadIndex.count = count
        }
    }
    
    // MARK: - Public Properties
    /// UserDefault에서 카운트 값 가져오기
    public var getCount: Int {
        switch self {
        case .veryHappy:
            return EmotionUserDefaults.VeryHappyIndex.count
        case .moderateSmile:
            return EmotionUserDefaults.ModerateSmileIndex.count
        case .neutral:
            return EmotionUserDefaults.NeutralIndex.count
        case .slightlyUpset:
            return EmotionUserDefaults.SlightlyUpsetIndex.count
        case .verySad:
            return EmotionUserDefaults.verySadIndex.count
        }
    }
    // MARK: - Public Methods
    /// UserDefault에 카운트 값 추가하기
    /// - Parameter num: 카운트 횟수
    public func addCount(_ num: Int) {
        switch self {
        case .veryHappy:
            EmotionUserDefaults.VeryHappyIndex.count += num
        case .moderateSmile:
            EmotionUserDefaults.ModerateSmileIndex.count += num
        case .neutral:
            EmotionUserDefaults.NeutralIndex.count += num
        case .slightlyUpset:
            EmotionUserDefaults.SlightlyUpsetIndex.count += num
        case .verySad:
            EmotionUserDefaults.verySadIndex.count += num
        }
    }
    
    
}



