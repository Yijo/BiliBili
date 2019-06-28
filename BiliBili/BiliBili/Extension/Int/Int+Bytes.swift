//
//  Int+Bytes.swift
//  BiliBili
//
//  Created by Near on 2019/6/28.
//  Copyright © 2019年 Yijo. All rights reserved.
//

extension Int {
    /** Array of bytes with optional padding (little-endian) */
    func bytes(_ totalBytes: Int = MemoryLayout<Int>.size) -> [UInt8] {
        let valuePointer = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        valuePointer.pointee = self
        
        let bytes = valuePointer.withMemoryRebound(to: UInt8.self, capacity: totalBytes) { (bytesPointer) -> [UInt8] in
            var bytes = [UInt8](repeating: 0, count: totalBytes)
            let minNum = MemoryLayout<Int>.size < totalBytes ? MemoryLayout<Int>.size : totalBytes
            for j in 0..<minNum {
                bytes[totalBytes - 1 - j] = (bytesPointer + j).pointee
            }
            return bytes
        }
        
        valuePointer.deinitialize(count: 1)
        valuePointer.deallocate()
        return bytes
    }
}
