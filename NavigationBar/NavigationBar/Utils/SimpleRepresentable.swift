import SwiftUI

/** A simple wrapper for UIViews for SwiftUI

 This simple wrapper allows to use a UIKit view within SwiftUI without having to
 write a custom adapter.

 `onCreation` will be called on `makeUIView` so the caller can specify
    custom, type-safe options for the view.

 Example:

    ```
    SimpleRepresentable<ErrorView> { errorView in
        errorView.onRetry = viewModel.fetchData
        errorView.configure(with: errorViewData)
    }
    ```
 */
public struct SimpleRepresentable<View: UIView>: UIViewRepresentable {
    let onCreation: (View) -> Void

    public init(onCreation: @escaping (View) -> Void) {
        self.onCreation = onCreation
    }

    public func makeUIView(context: Context) -> View {
        let view = View()
        onCreation(view)
        return view
    }

    public func updateUIView(_ uiView: View, context: Context) {}
}

/// A way to wrap a UIView controller quickly for swiftUI
public struct SimpleControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    let factory: () -> ViewController

    /// A way to wrap a UIView controller quickly for swiftUI
    /// - Parameter factory: a closure that will be used to create the view controller.
    ///
    /// Example:
    /// ```swift
    /// // with no parameters
    /// SimpleControllerRepresentable(MyViewController.init)
    ///
    /// // with parameters
    /// SimpleControllerRepresentable { MyViewController(frame: .zero) }
    /// ```
    public init(_ factory: @escaping () -> ViewController) {
        self.factory = factory
    }

    public func makeUIViewController(context: Context) -> ViewController {
        factory()
    }

    public func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
