//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import RIBs

///@mockable
protocol HealthInteractable: Interactable {
    var router: HealthRouting? { get set }
    var listener: HealthListener? { get set }
}

///@mockable
protocol HealthViewControllable: ViewControllable {
    func present(_ viewController: ViewControllable)
}

final class HealthRouter: ViewableRouter<HealthInteractable, HealthViewControllable>, HealthRouting {
    
    
    override init(
        interactor: HealthInteractable,
        viewController: HealthViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
