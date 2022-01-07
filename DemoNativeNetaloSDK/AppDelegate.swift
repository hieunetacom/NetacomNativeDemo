//
//  AppDelegate.swift
//  NetAlo
//
//  Created by NETACOM  on 03/01/2022.
//

import UIKit
import NACoreUI
import NetAloFull
import NetAloLite
import XCoordinator
import NALocalization
import NATheme
import RxCocoa
import RxSwift
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // MARK: Stored properties

    private lazy var mainWindow = UIWindow(frame: UIScreen.main.bounds)

    public var netAloFull: NetAloFull!

    private var disposeBag = DisposeBag()
    
    // MARK: - Application Delegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.netAloFull = NetAloFull(
            config: BuildConfig.config
        )
        
        // Only show SDK after start success, Waiting maximun 10s
        self.netAloFull
            .start()
            .timeout(.seconds(10), scheduler: MainScheduler.instance)
            .catchAndReturn(())
            .withUnretained(self)
            .observe(on: MainScheduler.instance)
            .do(onNext: { (owner, _) in
                // Init rooter
                owner.netAloFull.buildSDKModule()
                owner.mainWindow.rootViewController  = DemoSDKVC(netaloSDK: owner.netAloFull)
                owner.mainWindow.makeKeyAndVisible()
            })
            .subscribe()
            .disposed(by: disposeBag)
        
                
        //TODO: Only add this after client logined successfully
        //Select setUser1() or setUser2() for testing
        self.setUser1()
        //
        
        // Optional use notification
        self.netAloFull.requestNotificationtPermission()
        UNUserNotificationCenter.current().delegate = self
        
        return netAloFull.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    //Should be used to set 1 in 2 functions bellow for testing
    public func setUser1() {
        let user = NetAloUserHolder(id: 281474977724990,
                                    phoneNumber: "+84101000112",
                                    email: "",
                                    fullName: "NT +84101000112",
                                    avatarUrl: "",
                                    session: "35fd873187412b28389fca59dd7f9499932e1462")
        do {
            try self.netAloFull.set(user: user)
        } catch let e {
            print("Error \(e)")
        }
        
        
        bindingService()
    }
    
    //
    public func setUser2() {
        let user = NetAloUserHolder(id: 281474977694873,
                                    phoneNumber: "+84101000111",
                                    email: "",
                                    fullName: "T111",
                                    avatarUrl: "",
                                    session: "4d5c69aa059d04b761ab6a0eb985b74b7779e40c")
        do {
            try self.netAloFull.set(user: user)
        } catch let e {
            print("Error \(e)")
        }


        bindingService()
    }
    
    public func setUser3() {
            let user = NetAloUserHolder(id: 281474977755345,
                                        phoneNumber: "+84101002222",
                                        email: "",
                                        fullName: "2222",
                                        avatarUrl: "thhAatBj_G2qjNpG7HrS9T02o9HGnN30h7h7cMGEBqgWK0mrtQxkTnuF4yX2A0Rm",
                                        session: "6c061b7859692d01ba385477107b7342b9ee7c3e")
            do {
                try self.netAloFull.set(user: user)
            } catch let e {
                print("Error \(e)")
            }
            
            
            bindingService()
        }

    
    // MARK: - AppDelegateViewModelOutputs
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        netAloFull.applicationDidBecomeActive(application)
    }

    public func applicationWillResignActive(_ application: UIApplication) {
        netAloFull.applicationWillResignActive(application)
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        netAloFull.applicationWillTerminate(application)
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        netAloFull.application(application, supportedInterfaceOrientationsFor: window)
    }

    // UserActivity
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        netAloFull.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }

    // Notification methods
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        netAloFull.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        netAloFull.application(application, open: url, sourceApplication: sourceApplication, annotation: application)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        netAloFull.application(app, open: url, options: options)
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        netAloFull.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    }

    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        netAloFull.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }
}

//MARK: SDK call back
extension AppDelegate {
    //SDK binding service
    private func bindingService() {
        self.netAloFull.eventObservable
            .asDriverOnErrorJustSkip()
            .drive(onNext: { [weak self] event in
                guard let self = self else { return }
                dump("Event 🤟🏻🤟🏻🤟🏻🤟🏻🤟🏻🤟🏻 \(event)")
                switch event {
                case .pressedUrl(let url):
                    dump("PressedUrl 💪💪💪 : \(url)")
                case .mediaURL(let imageUrls, let videoUrls):
                    dump("Images 💪💪💪: \(imageUrls)")
                    dump("Video 💪💪💪: \(videoUrls)")
                case .checkUserIsFriend(let userId):
                    dump("Check Chat with 💪💪💪 : \(userId)")
                case .didCloseSDK:
                    dump("didCloseSDK 💪💪💪")
                case .pressedCall(let type):
                    dump("pressedCall 💪💪💪 type \(type)")
                case .sessionExpired:
                    dump("sessionExpired 💪💪💪")
                case .updateBadge(let badge) :
                    dump("updateBadge 💪💪💪 \(badge)")
                    if let vc = self.mainWindow.rootViewController as? DemoSDKVC {
                        vc.showBadge(with: badge)
                    }
                default: break
                }
            })
            .disposed(by: disposeBag)
    }

}
