# Device Type 

Every firmware component and application is device type-specific. There are multiple configurations set at this level, which are outlined below. 

### Max Retry Number

The max number of times a device will get sent the “startFota” command after upgrade errors have been reported. 

- This number can be overridden at the device group level or at the device level.

### Concurrent Device Upgrade Limit Per Device Group

For a given device type, you can set the maximum number of devices in a device group that can be upgrading firmware at the same time. The purpose of this feature is to reduce the load on nearby cell towers by doing too many firmware upgrades at once.

This can be overridden at the device group level. For example, if the limit is set so that 10 devices in a device group can upgrade at once, an override can be set so 30 devices in a specific group can upgrade at once.

### Stale Device Removal

If this option is enabled, and all concurrent upgrade seats are filled, devices that have been upgrading for longer than the max upgrade duration will lose their upgrade seat. When devices lose their upgrade seat, the upgrade timeout is reported as an error on the device. This error is counted in the maximum amount of retries a device has for FOTA upgrades.

- This can be overridden at the device group level.

### Reporting Same Firmware Application While Upgrading Handled As Error

If this option is enabled, and if a device reports the same firmware application while in an upgrading state, it will be assumed the device failed to report an error and a generic error will be reported on the device. This error is counted in the maximum amount of retries a device has for FOTA upgrades.
