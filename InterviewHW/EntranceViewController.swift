//
//  EntranceViewController.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/18.
//

import UIKit
import SnapKit

class EntranceViewController: UIViewController {
    
    var mTextField: UITextField = {
        var txf = UITextField()
        txf.placeholder = "請輸入行數"
        txf.keyboardType = .numberPad
        return txf
    }()
    
    var nTextField: UITextField = {
        var txf = UITextField()
        txf.placeholder = "請輸入列數"
        txf.keyboardType = .numberPad
        return txf
    }()
    
    lazy var confirmButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("確認", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(gotoGridViewController), for: .touchUpInside)
        
        return btn
    }()
    
    var centerStackView: UIStackView = {
        var stv = UIStackView()
        stv.axis = .vertical
        stv.spacing = 5
        stv.alignment = .center
        return stv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(centerStackView)
        centerStackView.addArrangedSubview(mTextField)
        centerStackView.addArrangedSubview(nTextField)
        centerStackView.addArrangedSubview(confirmButton)
        
        centerStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func gotoGridViewController() {
        guard let mText = mTextField.text,
                let m = Int(mText), m > 0 else {
            return
        }
        
        guard let nText = nTextField.text,
                let n = Int(nText), n > 0 else {
            return
        }
        
        let vm = GridViewModel(m: m, n: n)
        let vc = GridViewController(viewModel: vm)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}


