//
//  ViewController.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/16.
//

import UIKit
import SnapKit

class GridViewController: UIViewController {
    
    var viewModel: GridViewModel
    init(viewModel: GridViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var horizontalStackView: UIStackView = {
        var stv = UIStackView()
        stv.axis = .horizontal
        stv.alignment = .fill
        stv.distribution = .fillEqually
        stv.spacing = 4
        
        return stv
    }()
    
    var selectedCoordinate: (x: Int, y: Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        viewModel.randomCoordinate = { [weak self] coordinate in
          
            if let selectedCoordinate = self?.selectedCoordinate {
                self?.unmarkField(m: selectedCoordinate.x, n: selectedCoordinate.y)
                self?.removeFrame(m: selectedCoordinate.x)
                self?.unHighlightAction(m: selectedCoordinate.x)
            }
            
            self?.markField(m: coordinate.x, n: coordinate.y)
            self?.setFrame(m: coordinate.x)
            self?.highlightAction(m: coordinate.x)
            self?.selectedCoordinate = coordinate
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.startTimer(interval: 10, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.stopTimer()
    }
    
    private func setupUI() {
       
        self.view.backgroundColor = .white
        self.view.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.leading.equalTo(view.snp.leadingMargin).offset(10)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-10)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-10)
        }
        
        let m = viewModel.m
        let n = viewModel.n
        var colors: [UIColor] = []
        for _ in 0..<n {
            colors.append(Helper().randomColor())
        }

        for i in 1...m {
            let verticalStackView = CustomVerticalStackView(column: i)
            horizontalStackView.addArrangedSubview(verticalStackView)
            
            for j in 1...n {
                let field = CustomFieldView(coordinate: (i, j))
                field.backgroundColor = colors[j-1]
                verticalStackView.addArrangedSubview(field)
            }
            
            let action = CustomActionView(coordinate: (i, n))
            verticalStackView.addArrangedSubview(action)
            
            action.button.column = i
            action.button.addTarget(self, action: #selector(selectColumn), for: .touchUpInside)
        
        }
    }
    
    @objc func selectColumn(_ sender: CustomButton) {
        
        guard let selectedCoordinate = selectedCoordinate else {
            return
        }
        
        // 確定按鈕欄位是和選中的欄位是的同ㄧ行
        guard sender.column == selectedCoordinate.x else { return }
        
        unmarkField(m: selectedCoordinate.x, n: selectedCoordinate.y)
        removeFrame(m: selectedCoordinate.x)
        unHighlightAction(m: selectedCoordinate.x)
    }

    
    func markField(m: Int, n: Int) {
        findField(column: m, row: n)?.setTitle(text: "Random")
    }
    
    func unmarkField(m: Int, n: Int) {
        findField(column: m, row: n)?.setTitle(text: "")
    }
    
    private func findField(column: Int, row: Int) -> CustomFieldView? {
        
        guard let verticals = horizontalStackView.arrangedSubviews as? [CustomVerticalStackView] else {
            return nil
        }
        
        let vertical = verticals.filter { stv in
            stv.column == column
        }
        
        let customFieldViews = vertical.first?.arrangedSubviews.filter { $0 is CustomFieldView } as? [CustomFieldView]
        
        let view = customFieldViews?.filter { view in
            view.coordinate.row == row
        }
        
        return view?.first
    }
    
    func highlightAction(m: Int) {
        guard let field = findAction(column: m) else { return }
        field.button.backgroundColor = .cyan
        field.button.setTitleColor(.white, for: .normal)
    }
    
    func unHighlightAction(m: Int) {
        guard let field = findAction(column: m) else { return }
        field.button.backgroundColor = .clear
        field.button.setTitleColor(.gray, for: .normal)
    }
    
    private func findAction(column: Int) -> CustomActionView? {
        
        guard let verticals = horizontalStackView.arrangedSubviews as? [CustomVerticalStackView] else {
            return nil
        }
        
        let vertical = verticals.filter { stv in
            stv.column == column
        }
        
        let customFieldViews = vertical.first?.arrangedSubviews.filter { $0 is CustomActionView } as? [CustomActionView]
        
        return customFieldViews?.first
    }
    
    
    func removeFrame(m: Int) {
        findVerticalStackCView(column: m)?.removeOuterFrame()
    }
    
    func setFrame(m: Int) {
        findVerticalStackCView(column: m)?.addOuterFrame()
    }
    
    private func findVerticalStackCView(column: Int) -> CustomVerticalStackView? {
        
        guard let verticals = horizontalStackView.arrangedSubviews as? [CustomVerticalStackView] else {
            return nil
        }
        
        let vertical = verticals.filter { stv in
            stv.column == column
        }
        return vertical.first
    }
}

