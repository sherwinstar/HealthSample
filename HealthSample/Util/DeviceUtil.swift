//
//  DeviceUtil.swift
//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/17.
//

import UIKit

@objc
public class DeviceUtil: NSObject {
    
    @objc
    public static var statusBarHeight: CGFloat {
        return self.isIphoneX ? 44 : 20
    }

    
    @objc
    public static var navBarHeight: CGFloat {
        return self.statusBarHeight + 44
    }
    
    @objc
    public static var tabBarHeight: CGFloat {
        return self.safeAreaInsets.bottom + 49
    }
    
    @objc
    public static var isIphoneX: Bool {
        return self.safeAreaInsets.bottom > 0 && !self.isIpad
    }
    
    @objc
    public static var isIphone5: Bool {
        return self.screenWidth == 320
    }
    
    @objc
    public static var isIpad: Bool {
        UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
    }
    
    @objc
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    @objc
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    @objc
    public static var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

@objc
public extension DeviceUtil {
    
    @objc
    static var standardIPhoneScreenWidth: CGFloat {
        return 375
    }
    
    @objc
    static var standardIpadScreenWidth: CGFloat {
        return 810
    }
    
    @objc
    static func iphoneFrameXRatio(_ value: CGFloat) -> CGFloat {
        return value / standardIPhoneScreenWidth * screenWidth
    }
    
    @objc
    static func ipadFrameXRatio(_ value: CGFloat) -> CGFloat {
        return value / standardIpadScreenWidth * screenWidth
    }
    
    @objc
    static var defaultVipButtonFrameY: CGFloat {
        if isIphone5 {
            return 482
        } else if isIpad {
            return ipadFrameXRatio(841)
        } else if isIphoneX {
            return iphoneFrameXRatio(676)
        } else {
            return iphoneFrameXRatio(577)
        }
    }
}
