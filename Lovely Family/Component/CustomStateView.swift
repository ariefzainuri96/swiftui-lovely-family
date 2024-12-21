//
//  CustomStateView.swift
//  Simart UMBY
//
//  Created by фкшуа on 13/12/24.
//

import SwiftUI

struct CustomStateView<Content: View, Loading: View, ErrorComponent: View>: View {
    
    private var state: RequestState
    private var onRetry: (() -> Void)?
    private var loading: Loading?
    private var error: ErrorComponent?
    @ViewBuilder private var content: Content
    
    init(
        state: RequestState,
        onRetry: (() -> Void)? = nil,
        loading: (() -> Loading)? = nil,
        error: (() -> ErrorComponent)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.state = state
        self.onRetry = onRetry
        self.loading = loading?()
        self.error = error?()
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            ZStack {
                if state == RequestState.LOADING {
                    if let loading = loading {
                        loading
                    } else {
                        ProgressView().frame(width: 20, height: 20, alignment: .center).tint(.white)
                    }
                }
                
                if state == RequestState.ERROR {
                    if let error = error {
                        error
                    } else {
                        CustomError { (onRetry ?? {})() }
                    }
                }
                
                if state == RequestState.SUCCESS {
                    content
                }
            }.frame(maxWidth: .infinity, minHeight: 140, alignment: .center)
        }
    }
}

// Convenience Initializer for Optional `Loading` and `ErrorComponent`

extension CustomStateView where Loading == EmptyView {
    init(
        state: RequestState,
        onRetry: (() -> Void)? = nil,
        error: () -> ErrorComponent,
        @ViewBuilder content: () -> Content
    ) {
        self.state = state
        self.onRetry = onRetry
        self.error = error()
        self.content = content()
    }
}

extension CustomStateView where ErrorComponent == EmptyView {
    init(
        state: RequestState,
        onRetry: (() -> Void)? = nil,
        loading: () -> Loading,
        @ViewBuilder content: () -> Content
    ) {
        self.state = state
        self.onRetry = onRetry
        self.loading = loading()
        self.content = content()
    }
}

extension CustomStateView where Loading == EmptyView, ErrorComponent == EmptyView {
    init(
        state: RequestState,
        onRetry: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.state = state
        self.onRetry = onRetry
        self.content = content()
    }
}
