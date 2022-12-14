//
//  RootView.swift
//  NavigationBar
//
//  Created by Felipe Espinoza on 12/10/2022.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        SimpleControllerRepresentable {
            MainViewController()
        }
        .ignoresSafeArea()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
