//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import RIBs
import RxSwift

///@mockable
protocol RootRouting: ViewableRouting {
    func attachHealth()
    func attachHome()
}

///@mockable
protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

///@mockable
protocol RootListener: AnyObject {
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.attachHealth()
    }

    // MARK: - HealthListener
    
    func dismissHealthFlow() {
        router?.attachHome()
    }
    
    // MARK: - HomeListener
    
    func logout() {
        router?.attachHealth()
    }
}
