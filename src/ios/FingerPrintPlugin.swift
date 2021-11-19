import FingerprintSDK
import Foundation

public class FingerPrintPlugin: CDVPlugin {
    var command: CDVInvokedUrlCommand?
    var fingerprintResponse: FingerprintResponse!
    @objc func checkFingerprint(_ command: CDVInvokedUrlCommand) {
        self.command = command

        let fingerprintConfig = FingerprintConfig(mode: .EXPORT_WSQ, isPackPng: true)
        let vc = FaceoffViewController(nibName: "FaceoffViewController", bundle: Bundle(for: FaceoffViewController.self))
        vc.fingerprintConfig = fingerprintConfig
        vc.fingerprintResponseDelegate = self
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            rootVC.present(vc, animated: true, completion: nil)
        }
    }
}

extension FingerPrintPlugin: FingerprintResponseDelegate {
    public func onScanComplete(fingerprintResponse: FingerprintResponse) {
        self.fingerprintResponse = fingerprintResponse
        let jsonEncoder = JSONEncoder()
        if let fingerRes = self.fingerprintResponse {
            do {
                let jsonData = try jsonEncoder.encode(fingerRes)
                let json = String(data: jsonData, encoding: String.Encoding.utf8)
                let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: json)
                self.commandDelegate.send(pluginResult, callbackId: self.command?.callbackId)
            } catch {
                let pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: "Something went wrong")
                self.commandDelegate.send(pluginResult, callbackId: self.command?.callbackId)
            }
        }
    }
}
