//
//  ProgressHUD.swift
//  BiliBili
//
//  Created by Near on 2019/7/1.
//  Copyright © 2019年 Yijo. All rights reserved.
//
import Foundation
import Toaster

struct ProgressHUD {
    var text: String?
    
    var delay: TimeInterval
    
    var duration: TimeInterval
    
    var view: ToastView
    
    static let appearance = ToastView.appearance()

    private var toast: Toast
    
    // MARK: - Initialization
    init(text: String?, delay: TimeInterval = 0, duration: TimeInterval = Delay.short) {
        self.text = text
        self.delay = delay
        self.duration = duration
        
        toast = Toast(text: text, delay: delay, duration: duration)
        view = toast.view
    }
}

// MARK: - Show
extension ProgressHUD {
    func show() {
        cancel()
        // Show
        toast.show()
    }
    
    // Removing current toast
    func cancel() {
        if let currentToast = ToastCenter.default.currentToast {
            currentToast.cancel()
        }
    }
    
    // Removing all toasts
    func cancelAll() {
        ToastCenter.default.cancelAll()
    }
}
