//
//  ListEventsViewController.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-27.
//

import SwiftUI

final class ListEventsViewController<ViewModel: IListEventsViewModel>: UIHostingController<ListEventsView<ViewModel>> {
    
    // MARK: - Properties
    
    private let viewModel: ViewModel
    
    // MARK: - Life cycle
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: ListEventsView(viewModel: viewModel))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
