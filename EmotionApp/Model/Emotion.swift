//
//  EmotionManager.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import Foundation


enum Emotion: Int, CaseIterable {
    case veryHappy = 0
    case moderateSmile
    case neutral
    case slightlyUpset
    case verySad
    
    var getCount: Int {
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
    
    func addCount(_ num: Int) {
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



