//
//  ContentView.swift
//  Nabi
//
//  Created by Tudor Iustin on 20/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeViewV2(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Home",
                                      systemImage: "house")
                }
            TasksView(viewModel: TasksViewModel())
                .tabItem {
                                Label("Tasks",
                                      systemImage: "square.and.pencil")
                }
            
            HomeViewV2(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Gamma AI",
                                      systemImage: "apple.intelligence")
                }
            
            HomeViewV2(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Daily",
                                      systemImage: "lasso.badge.sparkles")
                }

        }
        .accentColor(Color.white)
    }
}

#Preview {
    ContentView()
}
