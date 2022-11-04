import UIKit

protocol RouterProtocol {
    func routeToBowlingController()
}

class BowlingRouter: RouterProtocol {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeToBowlingController() {
        let view = BowlingFactory.create(router: self)
        navigationController.setViewControllers([view], animated: true)
    }
    
}
