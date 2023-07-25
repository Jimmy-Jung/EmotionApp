//
//  UserDefault.swift
//  EmotionApp
//
//  Created by 정준영 on 2023/07/25.
//

import Foundation

@propertyWrapper
/// 유저디폴트 프로퍼티 래퍼
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

/// Emotion UserDefaults
struct EmotionUserDefaults {
    struct VeryHappyIndex {
        @UserDefault(key: keyEnum.veryHappyIndex.rawValue, defaultValue: 0)
        static var count: Int
    }
    struct ModerateSmileIndex {
        @UserDefault(key: keyEnum.moderateSmileIndex.rawValue, defaultValue: 0)
        static var count: Int
    }
    struct NeutralIndex {
        @UserDefault(key: keyEnum.neutralIndex.rawValue, defaultValue: 0)
        static var count: Int
    }
    struct SlightlyUpsetIndex {
        @UserDefault(key: keyEnum.slightlyUpsetIndex.rawValue, defaultValue: 0)
        static var count: Int
    }
    struct verySadIndex {
        @UserDefault(key: keyEnum.verySadIndex.rawValue, defaultValue: 0)
        static var count: Int
    }
    
    enum keyEnum: String, CaseIterable {
        case veryHappyIndex
        case moderateSmileIndex
        case neutralIndex
        case slightlyUpsetIndex
        case verySadIndex
    }
}



