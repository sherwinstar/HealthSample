//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/15.
//

import Anchorage
import RIBs
import RxSwift
import UIKit

///@mockable
protocol HealthPresentableListener: AnyObject {
    func didTapHealth()
}

final class HealthViewController: UIViewController, HealthPresentable, HealthViewControllable {

    weak var listener: HealthPresentableListener?
    let pieChart = HealthPieViewController()
    let combinedChart = HealthCombinedViewController()
    let view1 = UIView()
    let view2 = UIView()
    var naviHeight: CGFloat = 0
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Health"
        view.backgroundColor = UIColor.colorWithHex(hexStr: "#F2F2F2")
        naviHeight = DeviceUtil.isIphoneX ? 88 : 64;
        view1.frame = CGRect(x: 5, y: naviHeight, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - naviHeight - 10)
        view2.frame = CGRect(x: 5, y: UIScreen.main.bounds.height / 2, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - DeviceUtil.safeAreaInsets.bottom - 5)
        view.addSubview(view1)
        view.addSubview(view2)
        view1.clipsToBounds = true
        view2.clipsToBounds = true
        view1.layer.cornerRadius = 8;
        view2.layer.cornerRadius = 8;
        view2.backgroundColor = .white
        view2.backgroundColor = .white
        self.addChild(pieChart)
        view1.addSubview(pieChart.view)
        
        self.addChild(combinedChart)
        view2.addSubview(combinedChart.view)
        pieChart.view.frame = CGRect(x: 0, y: 0, width: view2.frame.size.width, height: view1.frame.size.height)
        combinedChart.view.frame = CGRect(x: 0, y: 0, width: view2.frame.size.width, height: view2.frame.size.height)
        let color = UIColor(red: CGFloat(63) / 255, green: CGFloat(103) / 255, blue: CGFloat(255) / 255, alpha: 1)
        titleLabel.frame = CGRect(x: 100, y: DeviceUtil.isIphoneX ? 44 : 20, width: UIScreen.main.bounds.width - 200, height: 44)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = color
        titleLabel.text = self.title
        
        view.addSubview(titleLabel)
        
        // 屏幕旋转通知
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillTransition), name: UIDevice.orientationDidChangeNotification, object: nil)
        
    }
    
//    @objc private func health() {
//
//        listener?.didTapHealth()
//
//    }

    
    // MARK - HealthViewControllable
    func present(_ viewController: ViewControllable) {
//        present(viewController.uiviewController, animated: true, completion: nil)
    }
    
    

    // 屏幕旋转将要旋转时会调用这个方法可以做视图适配
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            let orient = UIDevice.current.orientation
            if orient == .portrait {
                view1.frame = CGRect(x: 5, y: naviHeight, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - naviHeight - 10)
                view2.frame = CGRect(x: 5, y: UIScreen.main.bounds.height / 2, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - DeviceUtil.safeAreaInsets.bottom - 5)
                titleLabel.frame = CGRect(x: 100, y: DeviceUtil.isIphoneX ? 44 : 20, width: UIScreen.main.bounds.width - 200, height: 44)
                
            } else {
                view1.frame = CGRect(x: 5, y: naviHeight, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - naviHeight - 10)
                view2.frame = CGRect(x: 5, y: UIScreen.main.bounds.height / 2, width:UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height / 2 - DeviceUtil.safeAreaInsets.bottom - 5)
                titleLabel.frame = CGRect(x: 100, y: DeviceUtil.isIphoneX ? 44 : 20, width: UIScreen.main.bounds.width - 200, height: 44)
            }
        }
}
