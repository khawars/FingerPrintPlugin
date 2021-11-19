
# FingerprintPlugin

This is a cordova plugin for Fingerprint SDK.
### Installation

Add Cordova plugin to your project:
To add a Cordova plugin to your project, follow these steps:

1. Open a command prompt or terminal window.
2. Change directories to the root of your Cordova project.
3. Run the following command to add the plugin to your Cordova project:
   ``` $ cordova plugin add <path to plugin folder> ```
4. Run the following command to build your Cordova project:
   ```$ cordova build ```

### Example:
Call ``` checkFingerprint ``` method of plugin.

```cordova.exec(success, null, "FingerPrintPlugin", "checkFingerprint", [""]);```

### Request parameters:
There are no request parameters required for this function.

### Response:
Response will be in the form of JSON string and contains ``FingerprintResponse`` object.
