//
//  ContentView.swift
//  Restart
//
//  Created by Yusuf Berkay Girgin on 22.11.2022.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
      ZStack {
        if isOnboardingViewActive {
          OnBoardingView()
        } else {
          HomeView()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
