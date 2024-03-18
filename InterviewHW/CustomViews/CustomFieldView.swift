//
//  CustomFieldView.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/17.
//

import Foundation
import UIKit
import SnapKit

class CustomFieldView: UIView {
    var coordinate: (column: Int, row: Int) = (-1, -1)
    var titleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.text = "Default"
        return l
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
    
    private func setupUI() {
        self.backgroundColor = .white
        addSubview(titleLabel)
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        setTitle(text: "\(coordinate.column), \(coordinate.row)" )
    }
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
}
