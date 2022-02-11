# Firmware Application Releases

Firmware applications are released to a set of device groups for a single device type. Note that to release a firmware application to a device group, the firmware application must already exist in the system.

## Steps to Create a Firmware Application Release

- Select the device group(s) to release a new firmware application
- Select the device type 
- Select the firmware application version that will be released
- Configure the below options

    * Set the start time of the firmware application release 
    * Enable or disable upgrades outside of business hours
    * Enable or disable concurrent upgrade limits
    * Set the percentage of locators to include in the release

Business Hours: If a given group has business hours, a release can either be scheduled outside of those business hours or continuous. This is to reduce the risk of disrupting business operations.

Concurrent Upgrade Limit: The concurrent upgrade limit represents how many devices can upgrade their firmware in a device group at the same time. This number is set at the device type, then can be overridden at the device group level and while creating a release.

Percentage of Devices to Upgrade: The user can set the percentage of devices to upgrade for a given release. If you set the release to 10% initially, you can edit this release at a later date to release to 20%.


## Firmware Application Release States

- Scheduled: The firmware application release is scheduled, but the start time is in the future
- Active: The firmware application release is active at a given device group. The release will remain active until it is paused or cancelled, even if all devices in the group have upgraded. This is because if you add more devices to a group, you will want them to upgrade to this firmware version. 
- Paused: The firmware application is paused. Devices will not upgrade their firmware, but the firmware application release remains as the production release at this group. Resuming the firmware application sets the state back to active. 
- Ended: The firmware application has ended for a given group. To upgrade firmware application versions at this group, a new release has to be made.

