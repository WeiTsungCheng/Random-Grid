//
//  ViewModel.swift
//  InterviewHW
//
//  Created by WEI-TSUNG CHENG on 2024/3/18.
//

import Foundation

class GridViewModel {
    
    typealias Observer<T> = (T) -> Void
    var randomCoordinate: Observer<(x: Int, y: Int)>?
    private var timer: Timer?
    
    var m: Int
    var n: Int
    
    init(m: Int, n: Int) {
        self.m = m
        self.n = n
    }
    
    func startTimer(interval: Double, repeats: Bool) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats) { [weak self] _ in
                guard let self = self else { return }
                self.generateRandomCoordinate()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func generateRandomCoordinate() {
        let x = Int.random(in: 1...m)
        let y = Int.random(in: 1...n)
        randomCoordinate?((x, y))
    }
    
    
}
