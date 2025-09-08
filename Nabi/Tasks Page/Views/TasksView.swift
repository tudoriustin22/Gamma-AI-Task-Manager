//
//  TasksView.swift
//  Gamma
//
//  Created by Tudor Iustin on 03/09/2025.
//

import SwiftUI

struct TasksView: View {
    
    @ObservedObject var viewModel: TasksViewModel
    let bgColor = Color(red: 0x12/255, green: 0x12/255, blue: 0x12/255) // View Background Color

    var body: some View {
       
        Text("Hi")
        
    }
}

#Preview {
    TasksView(viewModel: TasksViewModel())
}
