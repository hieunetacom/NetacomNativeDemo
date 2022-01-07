//
//  DemoSDKVC.swift
//  DemoNativeNetaloSDK
//
//  Created by NETACOM on 03/01/2022.
//

import Foundation
import UIKit
import RxSwift
import NADomain
import NetAloFull
import NATheme
import Resolver

class DemoSDKVC: UIViewController {
    @LazyInjected public var themeManager: NAThemeServiceProtocol
    
    private let buttonChangeThemeBlue: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Theme Blue", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonChangeThemeOrange: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Theme Orange", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonShowChat: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("show chat", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonShowVN: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Vietnamese", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonShowEN: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("English", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonShowListGroup: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("show list group", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let buttonShowCall: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("personal call", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let stackview: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    
    private var netaloSDK: NetAloFull?
    
    init(netaloSDK: NetAloFull?) {
        self.netaloSDK = netaloSDK
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initSubview()
    }
    
    private func initSubview() {
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackview.topAnchor.constraint(equalTo: view.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        stackview.addArrangedSubview(buttonShowVN)
        stackview.addArrangedSubview(buttonShowEN)
        stackview.addArrangedSubview(buttonShowChat)
        stackview.addArrangedSubview(buttonShowListGroup)
        stackview.addArrangedSubview(buttonShowCall)
        stackview.addArrangedSubview(buttonChangeThemeBlue)
        stackview.addArrangedSubview(buttonChangeThemeOrange)
        buttonShowVN.addTarget(self, action: #selector(ActionShowVN), for: .touchUpInside)
        buttonShowEN.addTarget(self, action: #selector(ActionShowEN), for: .touchUpInside)
        buttonShowChat.addTarget(self, action: #selector(ActionShowChat), for: .touchUpInside)
        buttonShowListGroup.addTarget(self, action: #selector(ActionShowListGroup), for: .touchUpInside)
        buttonShowCall.addTarget(self, action: #selector(ActionShowCall), for: .touchUpInside)
        buttonChangeThemeBlue.addTarget(self, action: #selector(ActionChangeThemeBlue), for: .touchUpInside)
        buttonChangeThemeOrange.addTarget(self, action: #selector(ActionChangeThemeOrange), for: .touchUpInside)
    }
    
    public func showBadge(with number: Int) {
        self.buttonShowListGroup.setTitle( number != 0 ? "show list group ♥️" : "show list group", for: .normal)
    }
    
    @objc func ActionShowEN() {
        netaloSDK?.setLanguage(with: .english)
    }
    
    @objc func ActionShowVN() {
        netaloSDK?.setLanguage(with: .vietnamese)
    }
    
    @objc func ActionShowChat() {
        //Chat with user 2
        let testContact = NAContact(id: 281474977724836, phone: "+84101000020", fullName: "G20", profileUrl: "pFz0jhyeUzamyXcRx2dXkWUYApADL3Hcr2y6_nrCEV0qhblqq1Rzn4wyMxu2nqnH")
        netaloSDK?.showChat(with: testContact)
    }
    
    @objc func ActionShowListGroup() {
        netaloSDK?.showListGroup()
    }
    
    @objc func ActionShowCall() {
        let testContact = NAContact(id: 281474977724836, phone: "+84101000020", fullName: "G20", profileUrl: "pFz0jhyeUzamyXcRx2dXkWUYApADL3Hcr2y6_nrCEV0qhblqq1Rzn4wyMxu2nqnH")
        self.netaloSDK?.showCall(with: testContact, isVideoCall: false)
    }
    
    @objc func ActionChangeThemeBlue() {
        themeManager.setPrimaryColor(.blue)
    }
    
    @objc func ActionChangeThemeOrange() {
        themeManager.setPrimaryColor(.orange)
    }
    
}
