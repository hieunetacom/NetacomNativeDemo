# gem install cocoapods-binary
# plugin 'cocoapods-binary'

platform :ios, '11.0'
use_frameworks!
# keep_source_code_for_prebuilt_frameworks!
inhibit_all_warnings!

# ======================================GROUP PODS==========================================

def rx_pods
    pod 'RxSwift', '~> 6.2.0'
    pod 'RxCocoa', '~> 6.2.0'
    pod 'XCoordinator', '~> 2.0'
    pod 'RxGesture', '~> 4.0.2'
end

def rx_swift_pods
    pod 'RxSwift', '~> 6.2.0'
    pod 'RxRelay', '~> 6.2.0'
end

def app_pods
  # pod 'Firebase/Core'
  pod 'Firebase/Analytics', '6.21.0'
  pod 'Firebase/Crashlytics', '6.21.0'
  # pod 'Firebase/Auth', '6.21.0'

  # Localization 2.0
  pod 'Localize-Swift', :git => 'http://gitlab.ecdc.vn/hieubui/nt-Localize-Swift'

  # Tracking
  pod 'FBSDKCoreKit', '8.2.0'
  pod 'AppsFlyerFramework', '5.2.0'
  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => "4.3.1"

  rx_pods
  rx_swift_pods
  database_pods
  secret_pods
  socket_pods
  resolver
  pod 'Carbon', '~> 1.0.0-rc.6'
  pod 'Kingfisher', '6.1.1'
  pod 'NetaloSDKs', :git => 'http://gitlab.ecdc.vn/hieubui/NetaloSDKs', branch: 'release1'
  pod 'NotificationSDK', :git => 'http://gitlab.ecdc.vn/hieubui/NotificationSDK', branch: 'dev'
  pod 'JitsiMeetSDK', git: 'https://github.com/Netacom-NetAlo/JitsiSDK-iOS.git', branch: 'dev_1.2'
  pod 'Socket.IO-Client-Swift', '14.0.0'
  
  pod 'MessageKit', :git => 'https://github.com/thanhphong-tran/messagekit'
  pod 'SwiftLinkPreview', :git => 'https://github.com/Netacom-NetAlo/SwiftLinkPreview', branch: 'dev_1.0'
  pod 'Localize-Swift', :git => 'http://gitlab.ecdc.vn/hieubui/nt-Localize-Swift'
  pod 'ZIPFoundation', '~> 0.9'
end

def database_pods
  pod 'RealmSwift', '10.12.0'

  #pod 'NetaloCommonSDK', :git => 'http://gitlab.ecdc.vn/hieubui/NetaloCommonSDK', branch: 'database'
end

# Secret chat
def secret_pods
  pod 'SignalCoreKit', git: 'https://github.com/signalapp/SignalCoreKit.git', :commit => 'eea6884e55261bf157ad6054c72c3c51d7788d4c'
  pod 'AxolotlKit', git: 'https://github.com/signalapp/SignalProtocolKit.git', branch: 'master'
  pod 'HKDFKit', git: 'https://github.com/signalapp/HKDFKit.git'
  pod 'Curve25519Kit', git: 'https://github.com/signalapp/Curve25519Kit'
  pod 'GRKOpenSSLFramework', git: 'https://github.com/signalapp/GRKOpenSSLFramework', branch: 'mkirk/1.0.2t'
end

def socket_pods
  pod 'Socket.IO-Client-Swift', '14.0.0'
end

def testing_pods
#    pod 'Quick', '~> 1.0'
#    pod 'Nimble', '~> 7.0'
end

def resolver
  pod 'Resolver', tag: '1.4.4', git: 'https://github.com/thanhphong-tran/Resolver'
end

def component_pods
  rx_pods

  resolver
  pod 'Carbon', '~> 1.0.0-rc.6'
  pod 'Kingfisher', '6.1.1'
end

def notification_pods
  database_pods
  rx_swift_pods
  resolver

  pod 'Localize-Swift', :git => 'http://gitlab.ecdc.vn/hieubui/nt-Localize-Swift'
end

def share_pods
  database_pods
  rx_swift_pods
  resolver
  pod 'Carbon', '~> 1.0.0-rc.6'
  pod 'RxCocoa', '~> 6.2.0'
  pod 'RxGesture', '~> 4.0.2'
  pod 'Localize-Swift', :git => 'http://gitlab.ecdc.vn/hieubui/nt-Localize-Swift'
end

# ======================================TARGET PODS==========================================

target 'DemoNativeNetaloSDK' do
  app_pods
end


# ============================Notification Extension================================


# ============================Share Extension=======================================



# Disable Bitcode because of JitsiMeetSDK
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['ARCHS'] = 'arm64 x86_64'
    end
  end
end
