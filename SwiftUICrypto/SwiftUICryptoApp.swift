//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Ike Chukz on 5/22/23.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
