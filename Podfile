# gem install cocoapods-binary
# plugin 'cocoapods-binary'

platform :ios, '11.0'
use_frameworks!
# keep_source_code_for_prebuilt_frameworks!
inhibit_all_warnings!

# ======================================GROUP PODS==========================================

def rx_swift_pods
    pod 'RxSwift', '~> 6.2.0'
    pod 'RxCocoa', '~> 6.2.0'
    pod 'XCoordinator', '~> 2.0'
    pod 'RxGesture', '~> 4.0.2'
    pod 'RxRelay', '~> 6.2.0'
end

def database_pods
  pod 'RealmSwift', '10.12.0'
end

def language_pods
  # Localization 2.0
  pod 'Localize-Swift', :git => 'https://github.com/thanhphong-tran/Localize-Swift'
end

def netalo_pods
  #switch 1 or 2
  pod 'NetacomSDKs', :git => 'http://github.com/hieunetacom/NetacomSDKs', branch: 'demo/simulator_v1'
#  pod 'NetacomSDKs', :git => 'http://github.com/hieunetacom/NetacomSDKs', branch: 'demo/device_v1'
end

def common_pods
  pod 'MessageKit', :git => 'https://github.com/thanhphong-tran/messagekit'
  pod 'SwiftLinkPreview', :git => 'https://github.com/Netacom-NetAlo/SwiftLinkPreview', branch: 'dev_1.0'
  pod 'Kingfisher', '6.1.1'
  pod 'JitsiMeetSDK', git: 'https://github.com/Netacom-NetAlo/JitsiSDK-iOS.git', branch: 'dev_1.2'
  pod 'ZIPFoundation', '~> 0.9'
end

def tracking_pods
  pod 'Firebase/Analytics', '6.21.0'
  pod 'Firebase/Crashlytics', '6.21.0'
  pod 'FBSDKCoreKit', '8.2.0'
  pod 'AppsFlyerFramework', '5.2.0'
  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => "4.3.1"
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
  pod 'Carbon', '~> 1.0.0-rc.6'
  pod 'Kingfisher', '6.1.1'
end


def app_pods
  resolver
  rx_swift_pods
  component_pods
  secret_pods
  database_pods
  language_pods
  tracking_pods
  socket_pods
  common_pods
  netalo_pods
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
