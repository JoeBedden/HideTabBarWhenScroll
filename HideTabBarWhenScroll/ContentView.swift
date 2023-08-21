//
//  ContentView.swift
//  HideTabBarWhenScroll
//
//  Created by 雷子康 on 2023/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabState: Visibility = .visible
    var body: some View {
        TabView {
            NavigationStack {
                TabStateScrollView(axis: .vertical, showsIndicator: false, tabState: $tabState){
                    // 内部的图片
                    VStack(spacing: 15) {
                        ForEach(1...8, id: \.self) { index in
                            GeometryReader(content: { geometry in
                                let size = geometry.size
                                 
                                Image("Pic \(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .clipShape(RoundedRectangle(cornerRadius:12))
                            })
                            .frame(height: 180)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Home")
            }
            .toolbar(tabState, for: .tabBar)
            .animation(.easeInOut(duration: 0.3), value: tabState)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            // 其他Tab
            Text("Favourites")
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Favourites")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell")
                    Text("Notifications")
                }
            
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
