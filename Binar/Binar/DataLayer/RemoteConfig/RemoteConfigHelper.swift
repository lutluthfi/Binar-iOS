//
//  RemoteConfigHelper.swift
//  Binar
//
//  Created by Arif Luthfiansyah on 25/04/22.
//

import FirebaseRemoteConfig
import Foundation

final class RemoteConfigHelper {
    static let standard = RemoteConfigHelper()
    
    private let remoteConfig: RemoteConfig
    
    var adBanner: AdBannerRCEntity?
    
    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    func prepareValue() {
        remoteConfig.fetchAndActivate { [weak self] (status, error) in
            guard let _self = self else { return }
            if let _error = error {
                print("RemoteConfigHelper: Error > \(String(describing: _error))")
            } else if status == .successFetchedFromRemote || status == .successUsingPreFetchedData {
                _self.populateConfigValue()
            } else {
                print("RemoteConfigHelper: Unknown status > \(status)")
            }
        }
    }
    
    private func populateConfigValue() {
        let data: Data = remoteConfig.dataConfigValue(forKey: "instagram_home_ad_banner")
        adBanner = try? data.decode(to: AdBannerRCEntity.self)
        
        
    }
}

extension RemoteConfig {
    func boolConfigValue(forKey key: String) -> Bool {
        configValue(forKey: key).boolValue
    }
    
    func dataConfigValue(forKey key: String) -> Data {
        configValue(forKey: key).dataValue
    }
    
    func intConfigValue(forKey key: String) -> Int {
        configValue(forKey: key).numberValue as? Int ?? 0
    }
    
    func stringConfigValue(forKey key: String) -> String {
        configValue(forKey: key).stringValue ?? ""
    }
}
