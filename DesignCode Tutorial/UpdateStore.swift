//
//  UpdateStore.swift
//  DesignCode Tutorial
//
//  Created by Tad Scritchfield on 9/25/20.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
