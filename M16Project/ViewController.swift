import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabelView: UILabelView!

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

