//
//  BuildConfig.swift
//  NetAlo
//
//  Created by Tran Phong on 6/23/21.
//

import NetAloLite
import NetAloFull

struct BuildConfig {
    static var config = NetaloConfiguration(
        enviroment: .testing,
        appId: 1,
        appKey: "appkey",
        accountKey: "adminkey",
        appGroupIdentifier: "group.vn.netacom.netalo-dev",
        analytics: [],
        featureConfig: FeatureConfig(
            user: FeatureConfig.UserConfig(
                forceUpdateProfile : true,
                allowCustomUsername: true,
                allowCustomProfile : false,
                allowCustomAlert   : false,
                allowAddContact    : true,
                allowBlockContact  : true,
                allowSetUserProfileUrl   : false,
                allowEnableLocationFeature: true,
                allowTrackingUsingSDK: false,
                allowTrackingBadgeNumber: true
            ),
            chat: FeatureConfig.ChatConfig(isVideoCallEnable: true, 
                                           isVoiceCallEnable: true)
        )
    )
}
