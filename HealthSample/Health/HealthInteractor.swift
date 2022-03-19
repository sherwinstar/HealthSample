
//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import RIBs
import RxSwift

///@mockable
protocol HealthRouting: ViewableRouting {
//    func routeToCreateAccount()
//    func detachCreateAccount()
}

///@mockable
protocol HealthPresentable: Presentable {
    var listener: HealthPresentableListener? { get set }
}

///@mockable
protocol HealthListener: AnyObject {
    func dismissHealthFlow()
}

final class HealthInteractor: PresentableInteractor<HealthPresentable>, HealthInteractable, HealthPresentableListener {

    weak var router: HealthRouting?
    weak var listener: HealthListener?
    
    private let webService: WebServicing

    init(presenter: HealthPresentable, webService: WebServicing) {
        self.webService = webService
        super.init(presenter: presenter)
        presenter.listener = self
    }

    // MARK: - HealthPresentableListener
    
    func didTapHealth() {
        self.listener?.dismissHealthFlow()
    }
    
    
    // MARK: - CreateAccountListener
    
    func closeCreateAccountFlow() {
        
    }
}
