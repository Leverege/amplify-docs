# Introduction

Below is a brief introduction to the different terminology you'll run into in the Project Setup section. 

## Project

Projects are the top-level organization layer in our stack. They hold most other objects and data related to your solution, such as blueprints, systems, message routes, and scripts. A project has project-specific users (accounts), that are used to assign access to systems and devices.

## Blueprint

A Blueprint is used to define IoT device data and organizational data. Blueprints can have an alias that is useful when accessing data via the Model Interface API. The alias defines a human readable unique name for the model. Each Blueprint has a set of attributes. Messages for a Device can be routed based on its Blueprint type, allowing different handling of different data types.

## Attribute

An Attribute defines a field in a Blueprint. There are several types of Attributes such as string, numbers, units, timestamps and relationships. The Attributes can be used to dynamically interpret data in a Device.

## Device

A Device represents a thing, either an IoT device or an organizational construct. Each Device has a Blueprint that defines what kind of thing it is. Every Device has a Leverege generated UUID. The Device can have multiple source-specific IDs as well. These source-specific IDs are captured through the concept of a network alias.

## System

A System holds a collection of Devices. Project Users can be given access rights to a System, allowing different users to access different collections of Devices.

## Network

A Network represents a source of device data. When a device needs to be contacted, the Network is used as the target. In particular, messages are published to the `<networkId>-outbound topic`. The ingestion service setup to manage that network's data can listen on this topic and then communicate appropriately to the source server. The Network Id is also part of the external identity of a Device.

## Template

Templates are used to create branded emails or SMS notifications. When Reason triggers a send email request, a Template ID and contextual data can be supplied to produce the branded email.

## Users

There are two types of users in the Leverege Stack:

* **Platform Users** are users that can create and edit a Project and all of the supporting pieces such as Blueprints, Networks, Scripts.
* **Project Users** are end users of the resulting product. They have access to Systems and Devices. Project Users' usernames are unique to a Project, so two different Projects can have a user with the username 'demo'.

## Api Access

The Api Access key is used to allow a server to communicate with the Api Server as an admin of the project without having to login. This key is used with the api-service library.
