import UIKit

class ViewController: UIViewController {
    
    var database: [UIImage] = [UIImage(named: "folder")!]

    @IBOutlet weak var titleLabel: UILabel!

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stopActivityIndicatorButton: UIButton = {
        let view = UIButton(type: .close)
        view.setTitle("STOP", for: .disabled)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.titleLabel?.textColor = .black
        view.addTarget(UIButton.self, action: #selector(click), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
        setupConstraints()
        loadRandomImage()
        activityIndicator.stopAnimating()
    }
    
    private func setupViews() {
        view.addSubview(activityIndicator)
        view.addSubview(stopActivityIndicatorButton)
    }
    
    private func setupConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stopActivityIndicatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopActivityIndicatorButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
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
    
    @objc func click(sender: UIButton) {
        activityIndicator.stopAnimating()
        print(database)
    }
}

