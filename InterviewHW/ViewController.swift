//
//  ViewController.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var coordinate: (column: Int, row: Int) = (4, 3)
    
    var horizontalStackView: UIStackView = {
        var stv = UIStackView()
        stv.backgroundColor = .green
        stv.axis = .horizontal
        stv.alignment = .fill
        stv.distribution = .fillEqually
        stv.spacing = 0
        
        return stv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.leading.equalTo(view.snp.leadingMargin).offset(10)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-10)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-10)
        }
        
        for i in 1...coordinate.column {
            let verticalStackView = CustomVerticalStackView(column: i)
            horizontalStackView.addArrangedSubview(verticalStackView)
            for j in 1...coordinate.row {
                let field = CustomFieldView(coordinate: (i, j))
                verticalStackView.addArrangedSubview(field)
            }
            
            let action = CustomActionView(coordinate: (i, coordinate.row))
            verticalStackView.addArrangedSubview(action)
        }
        
    }


}

