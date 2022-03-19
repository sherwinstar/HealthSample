//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import Foundation

///@mockable
protocol WebServicing: AnyObject {
}

final class WebService: WebServicing {

}

enum WebServiceError: Error {
    case generic
}
