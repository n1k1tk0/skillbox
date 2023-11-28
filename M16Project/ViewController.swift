import UIKit

class ViewController: UIViewController {
    
    var database: [UIImage] = []

    @IBOutlet weak var titleLabel: UILabel!

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
        setupConstraints()
        loadRandomImage()
    }
    
    private func setupViews() {
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func loadRandomImage() {
        URLSession.shared.dataTask(
            with: URLRequest(url: URL(
                string: "https://asteropa.ru/wp-content/uploads/2022/01/d68d9aabee0cd831d17194a0cb113ada-e1643627857519.jpg"
            )!), completionHandler: { [weak self] data, _, _ in
                guard let self = self else { return }
                guard let data = data else { return }
                database.append(UIImage(data: data) ?? UIImage())
            }
        )
    }
}

