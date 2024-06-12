import Foundation

struct PackageManager {
    static let reservedNames = [
        "emacsos": "https://github.com/neetware/emacsos.git",
        "macfetch": "https://github.com/neetware/macfetch.git",
        "coreutils": "https://github.com/neetware/coreutils.git",
        "muttwiz": "https://github.com/LukeSmithxyz/mutt-wizard.git",
        "emailwiz": "https://github.com/LukeSmithxyz/emailwiz.git",
    ]

    static func gitExecutablePath() -> String {
        if let path = try? String(
            contentsOf: URL(fileURLWithPath: "/usr/bin/env"),
            encoding: .utf8
        ) {
            let parts = path.components(separatedBy: " ")
            return parts[0]
        }
        return "/usr/bin/git"
    }

    static func install(package: String) {
        if let url = reservedNames[package] {
            remove(package: package)
            let task = Process()
            task.executableURL = URL(fileURLWithPath: gitExecutablePath())
            task.arguments = ["clone", url, ".spm/\(package)"]
            task.currentDirectoryPath = "."
            task.launch()
            task.waitUntilExit()
            if task.terminationStatus == 0 {
                print("Package \(package) is now installed, run it with spm run \(package) command.")
            } else {
                print("Failed to install \(package)")
            }
        } else {
            print("\(package) is not a valid package")
        }
    }

    static func remove(package: String) {
        let packagePath = ".spm/\(package)"
        if FileManager.default.fileExists(atPath: packagePath) {
            try? FileManager.default.removeItem(atPath: packagePath)
            print("Package \(package) has been removed")
        }
    }
}

if CommandLine.arguments.count > 1 {
    switch CommandLine.arguments[1] {
    case "i":
        if CommandLine.arguments.count == 3 {
            let package = CommandLine.arguments[2]
            if FileManager.default.fileExists(atPath: ".spm/\(package)") {
                print("Package \(package) is already installed")
            } else {
                print("Installing \(package)")
                PackageManager.install(package: package)
            }
        }
    case "d":
        if CommandLine.arguments.count == 3 {
            let package = CommandLine.arguments[2]
            PackageManager.remove(package: package)
        }
    case "r":
        if CommandLine.arguments.count == 3 {
            let package = CommandLine.arguments[2]
            print("Running \(package)")
            print("\u{001B}[31mNOTICE: THE 'spm r <package>' COMMAND IS NOT IMPLEMENTED YET\u{001B}[0m")
            
        }
    case "u":
        if CommandLine.arguments.count == 3 {
            let package = CommandLine.arguments[2]
            PackageManager.remove(package: package)
            print("Updating package \(package)")
            PackageManager.install(package: package)
            print("Updated package\(package)")
        }
    case "help":
        print("\u{001B}[32mHelp for the 'Hack' package manager:\u{001B}[0m")
        print("")
        print("spm i <package> - Installs a package.")
        print("spm r <package> - Runs a package.")
        print("spm d <package> - Removes a package.")
        print("spm u <package> - Updates a package.")
        print("")
        print("\u{001B}[31mNOTICE: THE 'spm r <package>' COMMAND IS NOT IMPLEMENTED YET\u{001B}[0m")
    default:
        print("Invalid command, try spm help")
    }
}




