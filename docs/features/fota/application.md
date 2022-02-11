# Firmware Application & Component Management

## Creating Firmware Component Versions

Each firmware component has its own set of data fields that are required to create a new firmware component version. An example of the types of data each component has are below. 

Firmware Component Data Fields
- Device Type
- Type (MCU, BLE, etc)
- Semantic Version
- Component Specific Data Fields

## Creating Firmware Application Versions

To create a new version of the firmware application, the user defines the following information

Firmware Application Data Fields
- Device Type
- Semantic Version
- Components

    * BLE Component Version
    * MCU Component Version
    * etc

- Dependency (Upgrade Path)


### Dependency (Upgrade Path)

Every firmware application version has a dependency entry field that is filled out when the firmware application version is created. This field tells the system what the upgrade path for this specific application version is. Real examples of what this looks like are below.

#### Example 1

Firmware Application Version 0.2.0
Dependency: >= 0.1.0

The above example is saying that to upgrade to version 0.2.0, the version currently running on the hardware must be greater than or equal to version 0.1.0. 

#### Example 2

Firmware Application Version 0.8.0
Dependency: >=0.3.0 < 0.6.0 || >=0.7.0

The above example is saying that to upgrade to version 0.8.0, the version currently running on the hardware must be (1) greater than or equal to version 0.3.0 and less than version 0.6.0 or (2) greater than or equal to version 0.7.0.


## Upgrade Path Requirements

In order to move devices between applications, there are some limitations, outlined below.

There can only be one component type difference between consecutive applications a device can upgrade through. This serves to limit the risk inherent in the firmware upgrades.

We can skip component versions of the same component type, resulting in the ability to jump firmware application versions as shown by Example 2 above.
