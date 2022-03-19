//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import RIBs

///@mockable
protocol RootInteractable: Interactable, HealthListener, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

///@mockable
protocol RootViewControllable: ViewControllable {
    func replaceScreen(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let healthBuilder: HealthBuildable
    private var healthRouter: HealthRouting?
    private let homeBuilder: HomeBuildable
    private var homeRouter: HomeRouting?
    
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        healthBuilder: HealthBuildable,
        homeBuilder: HomeBuildable
    ) {
        self.healthBuilder = healthBuilder
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachHealth() {
        if let homeRouter = homeRouter {
            detachChild(homeRouter)
            self.homeRouter = nil
        }
        
        guard healthRouter == nil else { return }
        let router = healthBuilder.build(withListener: interactor)
        attachChild(router)
        healthRouter = router
        viewController.replaceScreen(viewController: router.viewControllable)
    }
    
    func attachHome() {
        if let healthRouter = healthRouter {
            detachChild(healthRouter)
            self.healthRouter = nil
        }
        
        guard homeRouter == nil else { return }
        let router = homeBuilder.build(withListener: interactor)
        attachChild(router)
        homeRouter = router
        viewController.replaceScreen(viewController: router.viewControllable)
    }
}
