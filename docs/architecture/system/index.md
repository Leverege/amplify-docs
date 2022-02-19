## Systems & Devices 

Now that we have blueprints that describe how our data will be structured and related, we can add some devices to our project. To do that, we first need to create a system.

Systems
The Core Concepts doc briefly describes Systems as follows:

A System holds a collection of Devices. Project Users can be given access rights to a System, allowing different users to access different collections of Devices.

Devices are the digital representations of the real world entities in our project: facilities, zones, trucks, trackers. They are collected in a system in our Imagine project. Systems are one of the places where we introduce permissioning and access control. 

Systems can be used to silo devices on a project. We could use it to separate a development and production data set, for example. Or we could use it to drive a multi-tenancy solution. If Tusk Trucking wanted to sell the SmartWalrus tracker to other trucking companies, we might set up multiple systems in Tusk’s project that allow a Tusk administrator to add/remove trackers across systems, but ensure that Seal Shipping’s trackers won’t show up in the Parcel Penguin UI. (The Leverege platform allows us to define permissions at a granular level at any point in the device chain, so we could achieve the same result in many different ways. Systems just give a clean, simple division for separating devices that will never need to interact.)

Creating a System
Go to the System tab on the left, and click + New System.

Click the Info tab at the top

Give your system a more descriptive name

Give your system a short alias 

The alias is how custom API calls will refer to this collection of devices. Using an alias instead of the system ID (which is also an option) allows us to make minimal changes when deploying a production application off of a staging or development environment. 


Creating Devices
For our Tusk Trucking project, we’re going to focus the pilot at a single facility with three zones. We’ll have three trackers, and three trucks.

Create the Facility
Let’s start by creating our facility. In your system view, click the Devices tab at the top. Click +New Device. Choose Facility as the type of device. (Don’t click the simulated checkbox. For this project, we are going to be mocking a production environment, and will not be using the simulator built into the Imagine platform.)

You’ll see your new Facility Device in the list. Click that row to reveal a device info editor on the right.

Here, you’ll see the header data for the device, including the device’s internal UUID, and name. The name here is used to identify the device in the devices list, and as a fallback name if nothing is supplied in the device’s data. 

We’ll say the name for this facility is Tusk HQ.


 

On the left panel where Tusk HQ is selected:

click the slider button (the middle of the three buttons on the right of the row). This will take us to the device’s data page.

From here, we can edit data about the device by clicking into any of the fields (Name, Position, StreetAddress), typing a value and hitting return. We can also add zones, trucks, and trackers to this facility.

Enter the facility name (Tusk HQ) in the name field. 

This may seem redundant, but we prefer to put end-user facing information in the data, because (a) it provides a history of changes, and (b) it gives us a consistent place to access all the data we care about when reading info about a device.

If you try to change a value, and no changes occur, then you’re probably not running some piece of the platform. Transponder (configured to write to firebase) or message-processor are likely candidates. 

We’ll skip the other two fields for now (we’ll set those with the UI that we build in 5. Frontend Development with Molten). 

Instead, let’s add some trackers. 

Click the + button in the top right of the trackers section

Click create new device in the dialog that appears


;
We’ve created our first tracker device, and automatically associated it to this facility. Click the → on your new tracker’s entry on this, the Tusk HQ facility’s device page, to go to the tracker’s device page.

Create the Trackers
When we click through to the tracker device page device, we’ll land on the data tab. This is the same view we were just on for our facility device. 

This is the first of three trackers we’ll create, which have the following IMEI identifiers: 981472630769911, 508830987016281, 103900341265889. (These come from the .env of the simulator we will use to feed the system.)

Let’s add 981472630769911 to the IMEI field here.

Add The Network Information
Unlike the facility we created, trackers will need to collect their data from the outside world. In the previous section, we created a network that defined how we can map an external identifier to the internal device: via a network. 

Now we need to add this device to the network we created:

Click the Info tab at the top of the device info screen

This screen is another way of editing the device header information (we saw a different editor from the devices list view, where it appeared in the side panel)

Give the tracker a name that describes what it is ('Tracker') and an identifier ('981472630769911')

From the Network dropdown, select your custom network

Choose Yes

Notice we now have two new fields we can update: imei, and macAddress. These correspond to the aliasKey fields you entered as comma separated values in the network creation screen.

Enter 981472630769911 into the imei field

We’ll leave the macAddress blank for now.

Click your system name (e.g., Tusk Production) in the breadcrumb at the top to be taken back to your device list.

;
Create the Remaining Trackers
From our list view, we have a few options to create new trackers. We could go to the Facility device, and add them via the facility’s trackers relationship. Or we could create new tracker items from this list. If we create them on this list, we just have to remember to associate these trackers with our facility afterward. To do that, simply go to the facility’s data page, click the + in the trackers section, and select the already created tracker from the list.

Create the Trucks
Creating the Trucks is a very similar process to creating trackers. Return to the Tusk HQ device data page where you created the trackers (click the slider button next to Tusk HQ)

Click the + button in the top right of the trucks section

Click create new device in the dialog that appears

Now that the truck is created, let’s give it a less generic name, and pair it with a tracker that will theoretically be installed in the truck. Click the → on your new truck’s entry to go to the truck’s device page.

Click the Info tab at the top of the device info screen, and change the truck name to Tusk Truck 1

Return to the data tab and click the Click to pair device + box at the bottom

Select tracker 981472630769911, and voila! You’re paired!

Repeat this process for one more truck, but leave the remaining truck and trucker unpaired. We’ll show more ways to interact with them later on. 
