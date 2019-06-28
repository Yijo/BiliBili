//
//  Realmable.swift
//  BiliBili
//
//  Created by Near on 2019/3/7.
//  Copyright © 2019年 Yijo. All rights reserved.
//

import RealmSwift
import Foundation

enum RealmError: Error {
    case open
    case write
    case read
    case close
    case pathNotFound
    case protectSetFailure(path: String)
}

extension RealmError {
    var localizedDescription: String {
        switch self {
        case .open:
            return "Open realm failure."
        case .write:
            return "Write data to realm failure."
        case .read:
            return "Read data from realm failure."
        case .close:
            return "Close realm failure."
        case let .protectSetFailure(path):
            return "Failed to set protection permission for \(path)."
        default:
            return "Not found path."
        }
    }
}



protocol Realmable {
    associatedtype T: Object
    
    var realm: Realm { get }

    /// Is use realm with Background app refresh
    var isUseBackGroundRefrsh: Bool { get }
    
    
    func setRealmConfigerForUser(username: String)
}

// MARK: - Default implementation.
extension Realmable {
    
    var realm: Realm {
        return try! Realm()
    }
    
    var isUseBackGroundRefrsh: Bool {
        return true
    }
    
    /// Set protection permission for realm file's parent directory.
    func setProtect() throws {
        // Get our realm file's parent directory
        guard let fileURL = realm.configuration.fileURL else {
            throw RealmError.pathNotFound
        }
        
        let folderPath = fileURL.deletingLastPathComponent().path
        
        // Disable file protection for this directory
        do {
            try FileManager.default.setAttributes([FileAttributeKey.protectionKey: FileProtectionType.none], ofItemAtPath: folderPath)
        } catch {
            throw RealmError.protectSetFailure(path: folderPath)
        }

    }
    

    
    func setRealmConfigerForUser(username: String) throws {
        var config = Realm.Configuration()

        guard let fileURL = config.fileURL else {
            throw RealmError.pathNotFound
        }
        
        config.fileURL = fileURL.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        
        Realm.Configuration.defaultConfiguration = config
    }
}


protocol RealmOperationable: Realmable {
    func add(object: T)
    
    func add(objects: [T])
    
    func add(object: T, update: Bool)
    
    func add(objects: [T], update: Bool)
    
    func object(_ type: T.Type) -> Results<T>?
    
    func object(_ type: T.Type, _ primaryKey: String) -> Results<T>?
    
    func delete(object: T)
    
    func delete(objects: Results<T>)
    
    /// Delete all data
    func deleteAll()
}
