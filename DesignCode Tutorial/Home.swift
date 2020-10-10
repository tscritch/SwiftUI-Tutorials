//
//  Home.swift
//  DesignCode Tutorial
//
//  Created by Tad Scritchfield on 9/14/20.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            HomeView(showProfile: $showProfile)
                .padding(.top, 44)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(
                    Angle(degrees: showProfile ? Double(viewState.height / 30) - 10 : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.7))
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.7))
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewState = value.translation
                        }
                        .onEnded { value in
                            if viewState.height > 50 {
                                showProfile = false
                            }
                            viewState = .zero
                        }
                )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { showProfile.toggle() }) {
            Image("Avatar")
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

let screen = UIScreen.main.bounds
