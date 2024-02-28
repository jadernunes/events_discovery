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
        GeometryReader { geo in
            List {
                ForEach(viewModel.events, id: \.id) { event in
                    EventView(data: event,
                              imageSize: geo.size.width * 0.25)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity)
            .refreshable {
                await viewModel.loadData()
            }
        }
        .navigationTitle("Event list")
    }
}
