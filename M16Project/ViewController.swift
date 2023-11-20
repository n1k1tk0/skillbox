import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

