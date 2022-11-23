//
//  HomeView.swift
//  Restart
//
//  Created by Yusuf Berkay Girgin on 22.11.2022.
//

import SwiftUI

struct HomeView: View {
  // MARK: - PROPERTY
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false // we do not define value here this line is just for safety reason in case of app won't find the "onboarding" varible
  @State private var isAnimating: Bool = false
  
  // MARK: - BODY
    var body: some View {
      VStack(spacing: 20) {
        // MARK: - HEADER
        Spacer()
        ZStack {
          CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
          Image("character-2")
            .resizable()
            .scaledToFit()
            .padding()
            .offset(y: isAnimating ? 35 : -35)
            .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            // .onAppear(perform: {
            //   isAnimating = true
            // })
        }
        
        // MARK: - CENTER
        Text("The time that leads to mastery is dependent on the intensity of our focuses")
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding()
        // MARK: - FOOTER
        Spacer()
        
        Button(action: {
          withAnimation {
            isOnboardingViewActive = true
            playSound(sound: "success", type: "m4a")
          }
        }) {
          Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
            .imageScale(.large)
          
          Text("Restart")
        } //: BUTTON
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
      } //: VSTACK
      .onAppear(perform: {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {isAnimating = true
        })
      })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
