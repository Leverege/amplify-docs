
# Permissions

## Terminology

| Field | Definition |
|-------|---------------|
| System | Systems are buckets of devices that can be used to logically separate sets of devices from each other. Systems use only the common CRUDL permissions. |
| Device | Devices are digital shadows of physical objects. They can represent hardware devices like trackers, physical assets like cows, or organizational buckets like companies. |
| Blueprint | Blueprints define the structure of our devices and relationship between device entities in our solution. Some permissions are generated when Blueprints or relationship Attributes are made.  |


## Common Permissions

Some permissions can be seen used against nearly every type of object in the platform. These are the CRUDL permissions. CRUDL is an acronym that stands for Create, Read, Update, Delete, List.

* Create - the permission to create an object
* Read - given some object’s id, the ability to read its data
* Update - given some object’s id, the ability to update its data
* Delete - given some object’s id, the ability to delete it
* List - the ability to get a list of all objects without having to know their ids


## System Permissions 

Systems are buckets of devices that can be used to logically separate sets of devices from each other. Systems use only the common CRUDL permissions.

## Device

Devices are digital shadows of physical objects. They can represent hardware devices like trackers, physical assets like cows, or organizational buckets like companies. Devices use the common CRUDL permissions, but also have the following custom permissions:

* readData - Read not only a device’s header information (like a name), but also its data, which might include things like sensor readings, addresses, or contact information.
* readHistory - View the changes to a device’s data over time
* readEvents - View the relevant events that have occurred to a device over time. Might include things like threshold violations or alerts.
* updateEvents - Update or create device events
* sendMessage - Send a device a message. This may only be relevant if a device is physically capable of receiving messages, like in the instance of configuring a tracker or other piece of hardware.
* runSimulation - Simulate a device
* readByNetworkAlias - Get devices by their network ids
* deleteRelationship - Delete a device's relationship. For instance, removing a cow from a barn stall, or unpairing a car and a tracker. Deleting a relationship will not delete the device.
* createRelationship - Create a device’s relationships. For instance, pairing a car and tracker. Creating a relationship does not create a device.
* updateData - Update a device’s data. This generates historical data points, and will be reflected to anyone with a readData permission. An example of updating a device’s data would be setting a Farm’s address.
* updateAnyData - A more powerful version of updateData. Users with updateData are restricted to updating fields as validated by the device’s Blueprint. Users with updateAnyData are not subject to that restriction. As an example, a user with updateData likely couldn’t change the temperature reported by a sensor, but a user with updateAnyData could. This permission is usually only for administrators.


## Blueprints & Relationships

Some permissions are generated when Blueprints or relationship Attributes are made. They tend to follow a similar form as the Device permissions. The main difference is that Blueprint or Attribute level permissions only allow a user to perform actions on Devices of a given type, or at certain paths in the hierarchy as defined by the Attributes. Their permissions are as follows:

### Blueprints:

* Create <blueprintName>: create Devices of a type
* Read <blueprintName>: read Devices of a type (if you know the id)
* Update <blueprintName>: update Devices of a type
* Delete <blueprintName>: delete Devices of a type
* List <blueprintName>: list Devices of a type
* Read <blueprintName> History: read the history of any Devices of a given type
* Read <blueprintName> Events: read the events of any Devices of a given type
* Update <blueprintName> Events: update the events of any Devices of a given type
* Send <blueprintName> Messages: send messages to any Devices of a given type
* Delete <blueprintName> Relationships: delete any relationships that go to Devices of a given type
* Create <blueprintName> Relationships: delete any relationships that go to Devices of a given type
* Update <blueprintName> Data: update the data of any Devices of a given type
* Update Any <blueprintName> Data: update any data (unvalidated) of any Devices of a given type

### Relationship Attributes

* Create <aName> in a <bName>: Create Devices of a given Blueprint at a given place in the hierarchy
* Read <aName> from a <bName>: Read Devices of a given Blueprint at a given place in the hierarchy (must know the id)
* Update <aName> in a <bName>: Update Devices of a given Blueprint at a given place in the hierarchy
* Delete <aName> from a <bName>: Delete Devices of a given Blueprint at a given place in the hierarchy
* List <aName> in a <bName>: List Devices of a given Blueprint at a given place in the hierarchy
* Read <aName> History in a <bName>: Read the history of Devices of a given Blueprint at a given place in the hierarchy
* Read <aName> Events in a <bName>: Read the events of Devices of a given Blueprint at a given place in the hierarchy
* Update <aName> Events in a <bName>: Update the events of Devices of a given Blueprint at a given place in the hierarchy
* Send <aName> Messages in a <bName>: Send messages to Devices of a given Blueprint at a given place in the hierarchy
* Remove <aName> from a <bName>: Delete relationships to Devices of a given Blueprint at a given place in the hierarchy
* Add <aName> to a <bName>: Create Relationships to Devices of a given Blueprint at a given place in the hierarchy
* Update <aName> data in a <bName>: Update the data of Devices of a given Blueprint at a given place in the hierarchy
* Update Any <aName> Data in a <bName>: Update any data (unvalidated) of Devices of a given Blueprint at a given place in the hierarchy


### Example

In our farming example, let's imagine we have the following hierarchy.

<figure markdown>
![!Cow Hierarchy](assets/hierarchy.svg){ width="700" }
  <figcaption>Example of Farm Hierarchy</figcaption>
</figure>

Let's say you want to give your farmhand role the ability to create a cow, but only in a location. Your permission for this would be:

* Create a cow in a location

This permission allows the user to create a cow when they are at the  location level  cows  page. This user would not be able to create a cow on the cows page at a company. 

Now, you want your farm manager role to be able to create a cow in a location and in a company. They would have two permissions on their role:

* Create a cow in a location
* Create a cow in a company

Finally, let's say instead of letting the farm manager role create cows in a location or in a company, you want them to be able to create a cow anywhere in the system. For this, you would use the  following blueprint-level permission

* Can create a cow


## API Access

ApiAccess objects represent sets of tokens/keys that allow third party services to connect to the Leverege Platform (usually as project level admins) using OAuth2. ApiAccesses use only the common CRUDL permissions.

## User

Users are the users of a give IoT project. Users use the common CRUDL permissions, but also have the following custom permissions:

* assignRoles - allows a user to assign roles to other users. Unless they’re admin, users can only assign roles they already have.

## Network

Networks represent a collection of mappings from external ids to internal Leverege ids. Networks ensure that only one device at a given time can have a given external mapping. For example, if you are sending tracker data into the Leverege Stack, that data will need some form of identifier to say what device it is from. Many times that id is chosen by the manufacturer, say a serial number or SKU. A network will map that serial number or SKU to a device’s unique id in the Leverege Stack, and ensure that mapping is one-to-one. Networks use only the common CRUDL permissions.

!!! Tip "Common Permission Needed for Pairing"
  readByNetworkAlias is a common permission that must be added to a role if that role is responsible for pairing one device to another and the network ID is used in the pairing form
