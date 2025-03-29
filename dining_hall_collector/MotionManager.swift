//
//  MotionManager.swift
//  dining_hall_collector
//
//  Created by Bruno Ndiba Mbwaye Roy on 3/28/25.
//
import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    private var timer: Timer?
    @Published var cycleCount: Int = 0
    private var currentSwing: SwingDirection? = nil
    private let threshold: Double = 0.7

    enum SwingDirection {
        case left, right
    }

    // this closure is called when the motion is detected
    var onShakeDetected: (() -> Void)?

    func startUpdates() {
        guard motionManager.isAccelerometerAvailable else {
            return
        }
        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.handleAccelerometerData()
        }
    }

    func stopUpdates() {
        motionManager.stopAccelerometerUpdates()
        timer?.invalidate()
        timer = nil
    }

    private func handleAccelerometerData() {
        guard let data = motionManager.accelerometerData else {
            return
        }
        let x = data.acceleration.x
        
        // Initialize swing direction if not set
        if currentSwing == nil {
            if x > threshold {
                currentSwing = .right
            } else if x < -threshold {
                currentSwing = .left
            }
        } else if currentSwing == .right && x < -threshold {
            // Detected a change from right to left
            currentSwing = .left
            cycleCount += 1
        } else if currentSwing == .left && x > threshold {
            // Detected a change from left to right
            currentSwing = .right
            cycleCount += 1
        }
        
        if cycleCount >= 2 {
            onShakeDetected?()
            stopUpdates()
        }
    }
}
