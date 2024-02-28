//
//  ListEventsView.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import SwiftUI

struct ListEventsView<ViewModel: IListEventsViewModel>: View {
    
    // MARK: - Properties
    
    @ObservedObject private var viewModel: ViewModel

    // MARK: - Life cycle
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            // TODO: - Handle it
        }.background(Color.red)
    }
}
