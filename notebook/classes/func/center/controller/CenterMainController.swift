//
//  CenterMainController.swift
//  livebook
//
//  Created by 赵超豪 on 2024/11/14.
//

import UIKit

class CenterMainController: RSDBaseViewController {
    @IBOutlet weak var styleControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let appTheme = UserDefaults.standard.string(forKey: KStore.appTheme.rawValue) {
//            self.styleSwitch.isOn = appTheme == VStore.APP_THEME_DARK
//        }else{
//            let style = UITraitCollection.current.userInterfaceStyle
//            self.styleSwitch.isOn = style == .dark
//            
//        }
    }

    @IBAction func styleAction(_ sender: Any) {
        if  self.styleControl.selectedSegmentIndex == 0 {
            
        }else if self.styleControl.selectedSegmentIndex == 1 {
            UserDefaults.standard.set(VStore.APP_THEME_DARK, forKey: KStore.appTheme.rawValue)
            Common.updateAppTheme(.dark)
        }else {
            UserDefaults.standard.set(VStore.APP_THEME_Light, forKey: KStore.appTheme.rawValue)
            Common.updateAppTheme(.light)
        }
        
        
    }
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
