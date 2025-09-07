//
//  SummaryModel.swift
//  Nabi
//
//  Created by Tudor Iustin on 22/08/2025.
//

import Foundation

protocol SummaryProtocol {
    var dayTime: String { get set }
    var userName: String { get set }
    var currentMeetings: Int { get set }
    var upcomingTasks: Int { get set }
    var currentHabits: Int { get set }
}



struct SummaryModel: SummaryProtocol {
    var dayTime: String
    var userName: String
    var currentMeetings: Int
    var upcomingTasks: Int
    var currentHabits: Int
}
