//
//  File.swift
//  
//
//  Created by Max Chuquimia on 6/1/20.
//

import Foundation

public func shell(_ command: String) throws -> String { try shell()(command) }

public func shell() -> (String) throws -> String {{
    let task = Process()
    task.launchPath = "/bin/bash"
    task.arguments = ["-c", $0]

    let pipe = Pipe()
    task.standardOutput = pipe

    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    task.waitUntilExit()

    let output: String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String

    if task.terminationStatus != 0 {
        throw "Task failed with code \(task.terminationStatus)"
    }

    return output
}}
