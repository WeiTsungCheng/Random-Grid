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
   
    var button: UIButton = {
        var btn = UIButton()
        btn.setTitle("OK", for: .normal)
        btn.setTitleColor(.black, for: .normal)
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
        self.backgroundColor = .white
        addSubview(button)
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    
        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
