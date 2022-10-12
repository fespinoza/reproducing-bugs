import SwiftUI
import Combine

class SampleContentAdapterController: UIViewController {
    private var observations: Set<AnyCancellable> = []

    let name: String
    let color: Color

    init(name: String, color: Color) {
        self.name = name
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var hostingController: UIHostingController = {
        UIHostingController(
            rootView: SampleContentTabView(
                name: name,
                color: color,
                onHello: presentChild
            )
        )
    }()

    var hostingView: UIView {
        hostingController.view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(hostingView)
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        hostingView.pinToSuperview()

        addChild(hostingController)
        hostingController.didMove(toParent: self)
    }

    func presentChild() {
        let nestedController = SampleContentAdapterController(name: name + " nested", color: .orange)
        navigationController?.pushViewController(nestedController, animated: true)
    }
}
