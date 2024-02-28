//
//  CacheAsyncImage.swift
//  EventsDiscovery
//
//  Created by Jader Nunes on 2024-02-28.
//

import SwiftUI

fileprivate let storageImage = NSCache<NSString, CacheData>()

struct CacheAsyncImage<Content: View>: View {

    // MARK: - Properties
    
    typealias ContentBuilder = (AsyncImagePhase) -> Content
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: ContentBuilder
    
    // MARK: - Life cycle
    
    init(url: URL,
         scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping ContentBuilder)  {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cached = storageImage.object(forKey: url.absoluteString as NSString) {
            content(.success(cached.image))
        } else {
            AsyncImage(
                url: url,
                scale: scale,
                transaction: transaction,
                content: { cacheAndRender(phase: $0) })
        }
    }
    
    // MARK: - Methods

    private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            storageImage.setObject(CacheData(image: image), forKey: url.absoluteString as NSString)
        }

        return content(phase)
    }
}

// MARK: - CacheData
/// As we don't need access to this item from out side of this file, we'll keep it as private

fileprivate protocol ICacheData {
    var image: Image { get }
}

fileprivate final class CacheData: ICacheData {
    
    // MARK: - Properties
    
    let image: Image
    
    // MARK: - Life cycle
    
    init(image: Image) {
        self.image = image
    }
}
