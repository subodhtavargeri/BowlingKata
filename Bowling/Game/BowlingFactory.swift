import UIKit

struct BowlingFactory {
    
    static func create(router: RouterProtocol) -> BowlingViewController {
        let roll = Roll()
        let game = Game(roll: roll)
        guard let view = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "BowlingViewController") as? BowlingViewController else {
            fatalError("Unable to Instantiate TicTacToeViewController")
        }
        
        let presenter = GamePresenter(game: game, view: view)
        view.setupPresenter(presenter: presenter)
        return view
    }
}


