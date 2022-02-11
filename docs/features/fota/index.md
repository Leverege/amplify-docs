# Introduction to FOTA Server

Firmware Component: A firmware component is a software program for a specific processor inside the hardware. Your hardware will generally have 2 or more components. Some common components are below.

- MCU: Main Processor Logic
- BLE: Bluetooth/Wifi Logic
 
Firmware Application: A firmware application contains programs for all three components. Each component is versioned. The firmware application is also versioned. This concept is similar to the iOS version running on your iPhone. 

Device  Type: The device type is the model of the hardware.Firmware applications are specific to a single device type, as one may have components that another device type does not. This concept is similar to an iPhone 4 vs an iPhone 5. 

Device Group: A device group is a subset of devices at a given blueprint (i.e. location) with the same device type. 


## How Does It Work?

The FOTA server manages the firmware upgrades of the hardware in the system. Every heartbeat, the device will check whether there is a firmware application upgrade available via the FOTA server. 

From there, if a firmware application update is available, the FOTA server attempts to upgrade the device to the latest firmware application version. The FOTA server will only attempt to upgrade one component at a time. Note that firmware application upgrade paths only allow for one component to be different between applications.  If successful, it updates the firmware application. If unsuccessful, the device can attempt to upgrade again. 

The amount of times the device retries is configurable per device type and the default is 3. If the device reaches the maximum amount of retries and has still not upgraded, the upgrade is stopped and marked as failed. Note that the maximum amount of retries applies to a single firmware application upgrade. If the device has to upgrade through multiple versions, each one will have a limit of retries equivalent to the configured amount per device type. 

The steps the FOTA server takes to check if the device should upgrade to a new firmware application are the following. If any of the below checks evaluate to false, the FOTA server does not upgrade the device: 

- Is there an active release?
- Is the device’s firmware already up to date?
- Has the device exceeded the maximum amount of retries?
- If upgrading outside of business hours is enabled, is the current time outside of business hours?
- If limiting concurrent upgrades is enabled, is there an open seat for this device?
- If stale device removal is enabled, are any of the devices currently upgrading “stale”? 
- If so, this device will replace the stale device
- If the upgrade is set to a percentage of devices <100%, has this upgrade already been applied to the set percentage?
- Is there an upgrade path for this device to get from it’s current firmware application version to the one set in the release?
