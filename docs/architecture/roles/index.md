# Role-Based User Management

The Leverege Stack uses a role-based access control system. Role-based access control refers to the idea of assigning permissions to users based on their role within an organization. It offers a simple, manageable approach to access management that is less prone to error than assigning permissions to users individually.

When using RBAC, you analyze the needs of your users and group them into roles based on common responsibilities. You then assign one or more roles to each user and one or more permissions to each role. The user-role and role-permissions relationships make it simple to perform user assignments since users no longer need to be managed individually, but instead have privileges that conform to the permissions assigned to their role(s).

For example, if you were using RBAC to control access for a cow tracking application, you could give farm manager a role that allows them create locations, add & manage users, and view employee performance analytics. Farm hands may have a role that only shows them the cows at a given location and any alerts associated with that location. 

When planning your access control strategy, it's best practice to assign users the fewest number of permissions that allow them to get their work done.


## Terminology

| Field | Definition |
|-------|---------------|
| Permission | Defines a single action that can be done (create, read, update, delete, list) |
| Role | A group of permissions that indicate what a user with this role can do. Usually based on the user personas of a given application. Roles have a specific ID referred to as role ID|
| Resource ID | The unique identity of something like a device, system, project, location, asset, etc.  |
| User ID | The unique ID of the ‘user’. Can be any ID representing the account. This is also the Api Access ID. |
| User Role | Combines a user ID and a role ID with a resource id |
| CRUDL | An acronym that stands for Create, Read, Update, Delete, List. These are the most common operations that can be performed on objects in the Leverege Stack |


## Permissions
The Leverege Stack contains many different types of data structures, and encompasses a large number of actions that can be performed against those data structures. As a result, the number of permissions within the system can be very large. In our farming example, let's imagine we have the following hierarchy.

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

Finally, let's say instead of letting the farm manager role create cows in a location or in a company, you want them to be able to create a cow anywhere in the system. For this, you would use the  following permission

* Create a cow


## Roles

Essentially, a role is a collection of permissions that you can apply to users. Using roles makes it easier to add, remove, and adjust permissions than assigning permissions to users individually. As your user base increases in scale and complexity, roles become particularly useful.

You can also use roles to collect permissions defined for various APIs. For example, say you have a third-party tool that tracks your barn equipment. Your barn equipment API role could have a `Create equipment in a location` &  `Update equipment in a location` permissions allow the API to create and update equipment in our database.


## User Roles

User Roles represent bindings between a user ID, role ID, and resource ID. As an example, a user role represents “giving Steve (User ID) the ability to act as a Farm Hand (Role ID) at Eric’s Farm (Resource ID)”. 
