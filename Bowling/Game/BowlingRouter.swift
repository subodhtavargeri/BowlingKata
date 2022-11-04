import UIKit

protocol RouterProtocol {
    func routeBowlingController()
}

class BowlingRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeBowlingController() {
        let view = BowlingFactory.create(router: self)
        navigationController.setViewControllers([view], animated: true)
    }
    
}
