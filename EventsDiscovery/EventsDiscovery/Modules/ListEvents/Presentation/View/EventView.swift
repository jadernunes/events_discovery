//
//  EventView.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import SwiftUI

struct EventView: View {
    
    // MARK: - Properties
    
    private let data: Event
    private let imageSize: CGFloat
    
    // MARK: - Life cycle
    
    init(data: Event, imageSize: CGFloat) {
        self.data = data
        self.imageSize = imageSize
    }
    
    var body: some View {
        HStack {
            HStack {
                imageView
                VStack(alignment: .leading) {
                    titleView
                    classificationView
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.vertical, 8)
                .padding(.trailing, 8)
            }
            .cornerRadius(8)
            .background(Color.white.clipShape(RoundedRectangle(cornerRadius:8)))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .overlay(eventBoarder)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Methods
    
    private func imageWithStyle(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

// MARK: - Elements

private extension EventView {
    
    @ViewBuilder
    var imageView: some View {
        if let url = URL(string: data.urlString) {
            CacheAsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    imageWithStyle(image: image)
                case .failure:
                    imageWithStyle(image: CustomImages.NoImage.image)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: imageSize, height: imageSize)
            .cornerRadius(8)
        } else {
            imageWithStyle(image: CustomImages.NoImage.image)
        }
    }
    
    var titleView: some View {
        Text(data.name)
            .lineLimit(2)
            .font(.system(size: 16, weight: .semibold))
            .padding(.bottom, 8)
    }
    
    var classificationView: some View {
        HStack {
            Text("Classification: ").font(.system(size: 12, weight: .regular))
            Text(data.classification).font(.system(size: 12, weight: .thin))
        }
    }
    
    var eventBoarder: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(.black.opacity(0.1), lineWidth: 1)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}
