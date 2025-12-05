// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

class SettingVC: UIViewController {
    private var settingsView: SettingsView {
        if let castedView = view as? SettingsView {
            return castedView

        } else {
            fatalError(fatalCastMessage(view: SettingsView.self))
        }
    }

    override func loadView() {
        view = SettingsView(frame: UIScreen.main.bounds)
        settingsView.sortSegmentedControl.addTarget(self, action: #selector(SettingVC.sortOrderChanged(_:)), for: .valueChanged)
        settingsView.sortSegmentedControl.selectedSegmentIndex = SortOrder.current.segmentIndex
    }

    @objc func sortOrderChanged(_ sender: UISegmentedControl) {
        SortOrder.current = SortOrder.sortOrderForIndex(settingsView.sortSegmentedControl.selectedSegmentIndex)
    }
}
