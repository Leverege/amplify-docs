# Networks

A Network represents a source of device data. When a device needs to be contacted, the Network is used as the target. In particular, messages are published to the <networkId>-outbound topic. The ingestion service setup to manage that network's data can listen on this topic and then communicate appropriately to the source server. The Network Id is also part external identity of a Device.

Inside the Leverege Stack, devices (and many other elements of a project) are assigned a base 62 UUID. These look something like this: 1pTW01YR4mUAEbcHhbXHk8. 

But these IDs are not how devices refer to themselves when sending a message, or how users refer to a device when they need to interact with it. The SmartWalrus tracker we will be integrating with, recall, sends an IMEI as its identifier when it reports. A worker at a Tusk Trucking facility might pair a tracker to a truck by scanning a QR code or type a name from a label printed on the device into the system.  For this project, let’s assume the SmartWalrus trackers have a QR code which encodes the MAC address of the tracker.  

Networks let us define how our internal devices will be mapped onto the the source, and set up messaging topics that allow communication with the device using these external names. 

## Creating a Network
In your Architect project, click the Networks tab on the left side, and click the + Custom button. The network creation form asks for three fields: a name, an api key (what we’ll call a networkId for reasons that will be come clear in a moment), and list of network identifiers (what we’ll call aliasKeys). (These are confusing names. Can we change them?)


### Core Concepts: networkId, aliasKey, deviceId
To understand what work these options are doing, let’s take a look at our message docs for inbound messages (NEED TO ACTUALLY INCLUDE A DOC FOR INBOUND DEVICE MESSAGE IN THE README). Note these three items:


/**
 ...
 * @param {string} data.networkId The networkId of the source
 * @param {string} data.deviceId A string representing the external name of the device. This could be an IotHub device id, a MAC address of a sensor, etc
 * @param {string} data.aliasKey The name of the key that forms the mapping between the external device’s id and the internal device. This is stored in the internal device’s aliases list, and tends to be unique per network.
 ...
 */

Inbound messages include a networkId, an aliasKey, and a deviceId. These three pieces of information tell our platform how to lookup that device:

deviceId : The external name for the individual device (e.g., ‘981472630769911’)

aliasKey : This describes what type of identifier the given device ID is (is it an IMEI? A MAC address?). It refers to a identifier type that we will enter into our network definition.

networkId : (called an ‘Api Key’ in Imagine) The tells us which network, in of all of the networks on the given API server, the API should look to find this device. (There may be many projects running on the same API server which identify their devices with MAC addresses or IMEIs.)

API Server will, in essence, look at the given network for a device with an aliasKey value equal to the deviceId, and route the message to that device. 

In creating the network, we are defining the networkId and the aliasKeys on that network. The actual deviceId gets created at the device level.

Choosing Good Network Values
Back to our Imagine UI, where we are creating the network, we need to choose the name, networkId (there called ‘Api Key’), and available aliasKeys (there called identifiers). 

The name is simply a human readable display name for the network, so that we can pick it out on our list of networks. We are creating the network for our SmartWalrus trackers, so let’s call it Tusk SmartWalrus Network.

The networkId (entered in the ‘Api Key’ field) must be unique across all projects in Imagine. It should be short, and describe the source / interface. So ‘tusk-tracker-network’ is good, something like ‘dev-trackers’ would be bad. (By convention, networkIds are skewer cased.)

The aliasKeys are the types of external identifiers. The devices provide us with IMEIs when they send messages, and the users will use the MAC addresses. It’s a good practice to be descriptive and specific with these names (and not just default to ‘deviceId’, for example). So lets set that field to ‘imei,macAddress’.


To tie this together, this tells us that a parsed inbound SmartWalrus device message from our ingestor might look something like this:



{
  type : 'inboundDataEventMsg',
  time : 1619388341985,
  networkId : 'tusk-network',
  aliasKey : 'imei',
  deviceId : '981472630769911',
  data : [
   { path : 'temperature', value : 30.20 }
  ],
}

