//
//  CustomVerticalStackView.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/17.
//

import Foundation
import UIKit

class CustomVerticalStackView: UIStackView {
    
    var column: Int = -1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        
        setupUI()
    }
    
    required init(column: Int) {
        super.init(frame: CGRect.zero)
        
        self.column = column
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 10
        self.axis = .vertical
    }
    
    func addOuterFrame() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.cyan.cgColor
    }
    
    func removeOuterFrame() {
        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
    }
}
