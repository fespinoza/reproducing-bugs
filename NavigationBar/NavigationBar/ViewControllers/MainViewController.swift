import SwiftUI

class MainViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setViewControllers(
            [one, two, three],
            animated: false
        )
    }

    required init?(coder: NSCoder) { fatalError() }

    private lazy var one: UINavigationController = {
        let viewController = UINavigationController(
            rootViewController: Self.sampleViewController(name: "one", tag: 1)
        )
        return viewController
    }()

    private lazy var two: UINavigationController = {
        let viewController = UINavigationController(
            rootViewController: Self.sampleAdapterController(name: "two", tag: 2)
        )
        return viewController
    }()

    private lazy var three: UINavigationController = {
        let viewController = UINavigationController(
            rootViewController: Self.sampleViewController(name: "three", tag: 3)
        )
        return viewController
    }()


    static private func sampleViewController(name: String, tag: Int) -> UIViewController {
        let controller = UIHostingController(rootView: SampleContentTabView(name: name))
        controller.tabBarItem = .init(
            title: name,
            image: UIImage(systemName: "rectangle.fill"),
            tag: tag
        )
        return controller
    }

    static private func sampleAdapterController(name: String, tag: Int) -> UIViewController {
        let controller = SampleContentAdapterController(name: name, color: .mint)
        controller.tabBarItem = .init(
            title: name,
            image: UIImage(systemName: "rectangle.fill"),
            tag: tag
        )
        return controller
    }
}
