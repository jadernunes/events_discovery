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
        switch viewModel.state {
        case .empty:
            MessageRetryView(imageName: "noData", message: "No data")
                .onRetry {
                    await viewModel.loadData(currentEvent: nil)
                }
        case .loading:
            loadingView
        case .error:
            MessageRetryView(imageName: "error", message: "Something went wrong")
                .onRetry {
                    await viewModel.loadData(currentEvent: nil)
                }
        case let .ready(events):
            loadContent(events)
        default:
            EmptyView()
        }
    }
    
    private func loadContent(_ events: [Event]) -> some View {
        GeometryReader { geo in
            List {
                ForEach(events, id: \.id) { event in
                    EventView(data: event,
                              imageSize: geo.size.width * 0.25)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .task {
                        await viewModel.loadData(currentEvent: event)
                    }
                    
                    if viewModel.shouldShowLoadMore(currentEvent: event) {
                        loadingView
                    }
                }
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity)
            .refreshable {
                await viewModel.loadData(currentEvent: nil)
            }
        }
        .navigationTitle(Localize.string(key: "listEvents.title"))
    }
    
    private var loadingView: some View {
        VStack(alignment: .center) {
            LoaderView()
        }
        .frame(maxWidth: .infinity)
    }
}
