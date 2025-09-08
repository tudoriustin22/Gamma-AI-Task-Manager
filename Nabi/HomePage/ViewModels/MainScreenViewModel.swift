//
//  MainScreenViewModel.swift
//  Nabi
//
//  Created by Tudor Iustin on 22/08/2025.
//

import Foundation
import Combine

class MainScreenViewModel: ObservableObject {

    @Published var userSummary: [SummaryModel] = [SummaryModel(dayTime: getCurrentTime(), userName: getName(), currentMeetings: 2, upcomingTasks: 4, currentHabits: 3)]
    
}


func getName() -> String {
    let userName: String = "Tudor"
    return userName
}

func getCurrentTime() -> String {
    let currentHour = Calendar.current.component(.hour, from: Date())
    if currentHour < 12 {
        return "Good morning"
    } else if currentHour < 18 {
        return "Good afternoon"
    } else if currentHour < 24 {
        return "Good evening"
    }
    return ""
}
