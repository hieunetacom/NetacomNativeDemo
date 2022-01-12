//
//  Injection.swift
//  NotificationExtension
//
//  Created by Hieu Bui Van  on 12/01/2022.
//

import Resolver
import NotificationComponent

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { NotificationComponentImpl(enviroment: BuildConfig.enviroment, appGroupId: BuildConfig.appGroupId) as NotificationComponent }
            .scope(.cached)
    }
}

