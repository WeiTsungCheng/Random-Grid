//
//  CustomActionView.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/17.
//

import Foundation
import UIKit
import SnapKit

class CustomActionView: UIView {
    
    var coordinate: (column: Int, row: Int) = (-1, -1)
   
    var button: CustomButton = {
        var btn = CustomButton()
        btn.setTitle("確定", for: .normal)
        btn.setTitleColor(.gray, for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        
        setupUI()
    }
    
    required init(coordinate: (column: Int, row: Int)) {
        super.init(frame: CGRect.zero)
        
        self.coordinate = coordinate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .black
        addSubview(button)
    
        button.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.bottom.trailing.equalToSuperview().offset(-8)
        }
    }
}


class CustomButton: UIButton {
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
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 8
    }
    
    
}

