//
//  Util.swift
//  Blocked
//
//  Created by Joe Diragi on 2/17/22.
//

import Foundation

let plistLocation: String = "/var/mobile/Library/Preferences/com.apple.cmfsyncagent.plist"
var dictionary = NSMutableDictionary(contentsOfFile: plistLocation)

var topLevel: NSMutableDictionary = dictionary!["__kCMFBlockListStoreTopLevelKey"] as! NSMutableDictionary
var array: NSMutableArray = topLevel["__kCMFBlockListStoreArrayKey"] as! NSMutableArray

func addToBlockList(toBlock: String) -> Bool {
    let dictToAdd: NSMutableDictionary = [
        "__kCMFItemEmailUnformattedKey": toBlock,
        "__kCMFItemTypeKey": 1,
        "__kCMFItemVersionKey": 1
    ]
    array.insert(dictToAdd, at: 0)
    writeToFile()
    return verify(val: toBlock)
}

func removeFromBlockList(toRemove: String) {
    array.forEach { e in
        let element: NSMutableDictionary = e as! NSMutableDictionary
        if (element["__kCMFItemEmailUnformattedKey"] as! String == toRemove) {
            array.remove(e)
        }
    }
}

func writeToFile() {
    dictionary?.write(toFile: plistLocation, atomically: true)
}

func verify(val: String) -> Bool {
    var result: Bool = false
    let newDict = NSMutableDictionary(contentsOfFile: plistLocation)
    let topLevel: NSMutableDictionary = newDict!["__kCMFBlockListStoreTopLevelKey"] as! NSMutableDictionary
    let array: NSMutableArray = topLevel["__kCMFBlockListStoreArrayKey"] as! NSMutableArray
    array.forEach { e in
        let element: NSMutableDictionary = e as! NSMutableDictionary
        if (element["__kCMFItemEmailUnformattedKey"] as? String == val) {
            result = true
        }
    }
    return result
}
