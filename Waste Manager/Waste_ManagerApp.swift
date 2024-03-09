//
//  Waste_ManagerApp.swift
//  Waste Manager
//
//  Created by Ultiimate Dog on 04/03/24.
//

import SwiftUI

@main
struct Waste_ManagerApp: App {    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContainerView()
        }
    }
}

extension UIApplication {
    var keyWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        UIApplication.shared.keyWindow?.safeAreaInsets.swiftUiInsets ?? EdgeInsets()
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

// Gets the safe area except the bottom
private extension UIEdgeInsets {
    var swiftUiInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: 0, trailing: right)
    }
}
