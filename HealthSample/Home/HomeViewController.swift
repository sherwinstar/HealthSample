//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import Anchorage
import RIBs
import RxSwift
import UIKit

///@mockable
protocol HomePresentableListener: AnyObject {
    func didTapLogout()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
    
    weak var listener: HomePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Health"
        view.backgroundColor = .white
        
        let view1 = UIView(frame: CGRect(x: 0, y: 40, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 40))
        let view2 = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 2, width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
        view.addSubview(view1)
        view.addSubview(view2)
        let pieChart = HealthPieViewController()
        self.addChild(pieChart)
        view1.addSubview(pieChart.view)
        
        let combinedChart = HealthCombinedViewController()
        self.addChild(combinedChart)
        view2.addSubview(combinedChart.view)
//        pieChart.view.widthAnchor == view1.widthAnchor
        combinedChart.view.widthAnchor == view2.widthAnchor
        let color = UIColor(red: CGFloat(113) / 255, green: CGFloat(163) / 255, blue: CGFloat(248) / 255, alpha: 1)
        let titleLabel = UILabel(frame: CGRect(x: 100, y: 44, width: UIScreen.main.bounds.width - 200, height: 44));
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        titleLabel.textColor = color
        titleLabel.text = self.title
        let backButton = UIButton(frame: CGRect(x: 20, y: 44, width: 44, height: 44));
        backButton.setTitle("Back", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        backButton.setTitleColor(color, for: .normal)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        backButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    }
    
    @objc private func close() {
        listener?.didTapLogout()
    }
}
