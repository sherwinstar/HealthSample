//
//  HealthBuilder.swift
//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import RIBs

///@mockable
protocol HealthDependency {
    var webService: WebServicing { get }
}

final class HealthComponent: Component<HealthDependency> {
}

// MARK: - Builder

///@mockable
protocol HealthBuildable: Buildable {
    func build(withListener listener: HealthListener) -> HealthRouting
}

final class HealthBuilder: Builder<HealthDependency>, HealthBuildable {

    override init(dependency: HealthDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HealthListener) -> HealthRouting {
        let component = HealthComponent(dependency: dependency)
        let viewController = HealthViewController()
        let interactor = HealthInteractor(presenter: viewController, webService: component.dependency.webService)
        interactor.listener = listener
    
        
        return HealthRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
