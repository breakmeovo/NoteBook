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
        switch ThemeManager.shared.currentTheme {
        case .system:
            self.styleControl.selectedSegmentIndex = 0
        case .dark:
            self.styleControl.selectedSegmentIndex = 1
        case .light:
            self.styleControl.selectedSegmentIndex = 2
        }
    }

    @IBAction func styleAction(_ sender: Any) {
        if  self.styleControl.selectedSegmentIndex == 0 {
            ThemeManager.shared.currentTheme = .system
        }else if self.styleControl.selectedSegmentIndex == 1 {
            ThemeManager.shared.currentTheme = .dark
        }else {
            ThemeManager.shared.currentTheme = .light
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
