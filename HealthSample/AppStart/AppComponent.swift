//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//
import RIBs

final class AppComponent: Component<EmptyDependency>, RootDependency {
    var webService: WebServicing
    
    init() {
        webService = WebService()
        super.init(dependency: EmptyComponent())
    }
}
