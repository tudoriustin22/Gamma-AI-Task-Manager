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
            HomeView(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Home",
                                      systemImage: "house")
                }
            TasksView(viewModel: TasksViewModel())
                .tabItem {
                                Label("Tasks",
                                      systemImage: "pencil.and.outline")
                }
            
            HomeView(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Meetings",
                                      systemImage: "inset.filled.circle")
                }
            
            HomeView(viewModel: MainScreenViewModel())
                .tabItem {
                                Label("Repeat",
                                      systemImage: "repeat")
                }

        }
        .accentColor(Color.black)
    }
}

#Preview {
    ContentView()
}
