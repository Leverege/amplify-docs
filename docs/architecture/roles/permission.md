Contained on this page is a list of all the present Leverege Platform Api Objects that support role based authorization and their relevant permissions. People wishing to make custom roles for an ongoing project should start by reading the Auto-Generated and Device Permissions in particular.

Table of Contents
Common Permissions

Types

Project

System

Device

Hierarchy

Blueprint

MessageRoute

Network

OidcClient

Scenario

Script

Template

Timer

User

Contact

ApiAccess

Role

Permission

Module

Geotile

Rsrc

Hook

Enum/ResourceEnum

VIN

Auto-Generated Permissions

Common Permissions
Some permissions can be seen used against nearly every type of object in the platform. These are the CRUDL permissions. CRUDL is an acronym that stands for Create, Read, Update, Delete, List.

Create - the permission to create an object

Read - given some object’s id, the ability to read its data

Update - given some object’s id, the ability to update its data

Delete - given some object’s id, the ability to delete it

List - the ability to get a list of all objects without having to know their ids

Types
Project
Projects are a root level item in the Leverege Platform. They represent a container of other resources constituting a complete IoT solution. Projects use the common CRUDL permissions, but also have the following custom permissions:

loginAs - This permission allows a user to login as any other user in the project. This is powerful when given to third party API’s the user has developed, because it allows that third party API to act in the user’s capacity in the system.

System
Sytems are buckets of devices that can be used to logically separate sets of devices from each other. Systems use only the common CRUDL permissions.

Device
Devices are digital shadows of physical objects. They can represent hardware devices like trackers, physical assets like cows, or organizational buckets like companies. Devices use the common CRUDL permissions, but also have the following custom permissions:

readData - Read not only a device’s header information (like a name), but also its data, which might include things like sensor readings, addresses, or contact information.

readHistory - View the changes to a device’s data over time

readEvents - View the relevant events that have occurred to a device over time. Might include things like threshold violations or alerts.

updateEvents - Update or create device events

sendMessage - Send a device a message. This may only be relevant if a device is physically capable of receiving messages, like in the instance of configuring a tracker or other piece of hardware.

runSimulation - Simulate a device

readByNetworkAlias - Get devices by their network ids

deleteRelationship - Delete a device's relationship. For instance, removing a cow from a barn stall, or unpairing a car and a tracker. Deleting a relationship will not delete the device.

createRelationship - Create a device’s relationships. For instance, pairing a car and tracker. Creating a relationship does not create a device.

updateData - Update a device’s data. This generates historical data points, and will be reflected to anyone with a readData permission. An example of updating a device’s data would be setting a Farm’s address.

updateAnyData - A more powerful version of updateData. Users with updateData are restricted to updating fields as validated by the device’s Blueprint. Users with updateAnyData are not subject to that restriction. As an example, a user with updateData likely couldn’t change the temperature reported by a sensor, but a user with updateAnyData could. This permission is usually only for administrators.

Hierarchy
Effectively a clone of the Device module. The Hierarchy is designed to permission within the interface, but is rarely if ever used.

Blueprint
A blueprint is a guide to what a device’s data will look like. Blueprints contain a collection of Attributes that each define an individual piece of information about a device. Blueprints use only the common CRUDL permissions.

MessageRoute
MessageRoutes define the way a device’s data flows through the Leverege system. MessageRoutes can be attached to Blueprints or Devices (but usually only Blueprints). As an example, a message route for a Car might go first to a service that enhances the GPS location data of the device with a zone name on an auction lot, and then to the Leverege Transponder service to be written to the databases. MessageRoutes use only the common CRUDL permissions.

Network
Networks represent a collection of mappings from external ids to internal Leverege ids. Networks ensure that only one device at a given time can have a given external mapping. For example, if you are sending tracker data into the Leverege Platform, that data will need some form of identifier to say what device it is from. Many times that id is chosen by the manufacturer, say a serial number or SKU. A network will map that serial number or SKU to a device’s unique id in the Leverege Platform, and ensure that mapping is one-to-one. Networks use only the common CRUDL permissions.

OidcClient
OidcClients provide a mechanism for mapping external user management and authentication systems into the Leverege Platforms RBAC authorization system. Examples of this would be using Okta, Auth0, or Firebase Users for authentication. OidcClients use only the common CRUDL permissions.

Scenario
Scenarios are playable data simulations that can be run on top of simulated devices. They use a key-framing mechanism to make simulated devices act like real devices within the Leverege Platform. Scenarios use only the common CRUDL permissions.

Script
Scripts are user contributed code that can be used to process data within the Leverege Platform. Scripts are typically used as data enhancers or decorators on MessageRoutes. Scripts use the common CRUDL permissions, but also have the following custom permissions:

deploy - the ability to deploy the script’s code to a cloud function

undeploy - the ability to undeploy a script’s code from a cloud function

Template
Templates are Email or SMS based mechanisms for templating messages to users. The most common usage for Templates is sending custom account activation emails. Templates use only the common CRUDL permissions.

Timer
Timers are a mechanism for triggering delayed or repeating actions. They can be used to query urls, send pub/sub messages, or trigger reason scripts. Timers use the common CRUDL permissions, but also have the following custom permissions:

start - Timers don’t run unless started. The start permissions allows a user to start a timer running.

stop - Stops a Timer that is running.

User
Users are the users of a give IoT project. Users use the common CRUDL permissions, but also have the following custom permissions:

assignRoles - allows a user to assign roles to other users. Unless they’re admin, users can only assign roles they already have.

Contact
Contacts are lists of names, emails, and phone numbers that represent people who can be contacted about a given resource. Contacts exist on systems and devices. Contacts use only the common CRUDL permissions.

ApiAccess
ApiAccess objects represent sets of tokens/keys that allow third party services to connect to the Leverege Platform (usually as project level admins) using OAuth2. ApiAccesses use only the common CRUDL permissions.

Role
Roles are containers of permission that can be paired with users and resources of other types to grant permission to perform actions within the Leverege Platform. Roles use only the common CRUDL permissions.

Permission
Permissions define actions that can be taken in the Leverege Platform, and are used inside roles to define what users are authorized to do. Permissions use only the common CRUDL permissions.

Module
Modules are logical groupings of permissions. Modules use only the common CRUDL permissions.

Geotile
Geotiles are data sets that can be overlaid on maps in Leverege Applications. Geotiles use only the common CRUDL permissions.

Rsrc
Rsrc’s are loosely structured buckets of information related to other resources in the system. The most common use of Rsrc’s  is to hold User Settings in Molten based UI’s. Rsrc's use only the common CRUDL permissions.

Hook
Hooks are a mechanism used to tie into Leverege Platform events, such as device pairing, or user login. Hooks use only the common CRUDL permissions.

Enum/ResourceEnum
Enums/ResourceEnums are collections of values with metadata that define the possible values a certain type of thing can be. Users use the common CRUDL permissions, but also have the following custom permissions:

createValue - the permission to create an enum value

updateValue - the permission to update an enum value

deleteValue - the permission to delete an enum value

VIN
VINs are used to lookup vehicles and ascertain vehicle information from the VIN. VINS use only the common CRUDL permissions.

Auto-Generated Permissions
Some permissions are generated when Blueprints or relationship Attributes are made. They tend to follow a similar form as the Device permissions. The main difference is that Blueprint or Attribute level permissions only allow a user to perform actions on Devices of a given type, or at certain paths in the hierarchy as defined by the Attributes. Their permissions are as follows:


Blueprints:

Create <blueprintName>: create Devices of a type

Read <blueprintName>: read Devices of a type (if you know the id)

Update <blueprintName>: update Devices of a type

Delete <blueprintName>: delete Devices of a type

List <blueprintName>: list Devices of a type

Read <blueprintName> History: read the history of any Devices of a given type

Read <blueprintName> Events: read the events of any Devices of a given type

Update <blueprintName> Events: update the events of any Devices of a given type

Send <blueprintName> Messages: send messages to any Devices of a given type

Delete <blueprintName> Relationships: delete any relationships that go to Devices of a given type

Create <blueprintName> Relationships: delete any relationships that go to Devices of a given type

Update <blueprintName> Data: update the data of any Devices of a given type

Update Any <blueprintName> Data: update any data (unvalidated) of any Devices of a given type

Attributes

Create <aName> in a <bName>: Create Devices of a given Blueprint at a given place in the hierarchy

Read <aName> from a <bName>: Read Devices of a given Blueprint at a given place in the hierarchy (must know the id)

Update <aName> in a <bName>: Update Devices of a given Blueprint at a given place in the hierarchy

Delete <aName> from a <bName>: Delete Devices of a given Blueprint at a given place in the hierarchy

List <aName> in a <bName>: List Devices of a given Blueprint at a given place in the hierarchy

Read <aName> History in a <bName>: Read the history of Devices of a given Blueprint at a given place in the hierarchy

Read <aName> Events in a <bName>: Read the events of Devices of a given Blueprint at a given place in the hierarchy

Update <aName> Events in a <bName>: Update the events of Devices of a given Blueprint at a given place in the hierarchy

Send <aName> Messages in a <bName>: Send messages to Devices of a given Blueprint at a given place in the hierarchy

Remove <aName> from a <bName>: Delete relationships to Devices of a given Blueprint at a given place in the hierarchy

Add <aName> to a <bName>: Create Relationships to Devices of a given Blueprint at a given place in the hierarchy

Update <aName> data in a <bName>: Update the data of Devices of a given Blueprint at a given place in the hierarchy

Update Any <aName> Data in a <bName>: Update any data (unvalidated) of Devices of a given Blueprint at a given place in the hierarchy
