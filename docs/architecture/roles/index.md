# Roles & Permissions Overview

The Leverege Stack uses a role-based access control system. Role-based access control refers to the idea of assigning permissions to users based on their role within an organization. It offers a simple, manageable approach to access management that is less prone to error than assigning permissions to users individually.

When using RBAC, you analyze the needs of your users and group them into roles based on common responsibilities. You then assign one or more roles to each user and one or more permissions to each role. The user-role and role-permissions relationships make it simple to perform user assignments since users no longer need to be managed individually, but instead have privileges that conform to the permissions assigned to their role(s).

For example, if you were using RBAC to control access for a cow tracking application, you could give the farm manager a role that allows them create locations, add & manage users, and view employee performance analytics. Farm hands may have a role that only shows them the cows at a given location and any alerts associated with that location. 

When planning your access control strategy, it's best practice to assign users the fewest number of permissions that allow them to get their work done. This is called the Principle of Least Privilege. 


## Terminology

| Field | Definition |
|-------|---------------|
| Permission | Defines a single action that can be done (create, read, update, delete, list) |
| Role | A group of permissions that indicate what a user with this role can do. Usually based on the user personas of a given application. Roles have a specific ID referred to as role ID |
| Resource ID | The unique identity of something like a device, system, project, location, asset, etc.  |
| User ID | The unique ID of the ‘user’. Can be any ID representing the account. This is also the API Access ID. |
| User Role | Combines a user ID and a role ID with a resource ID |
| CRUDL | An acronym that stands for Create, Read, Update, Delete, List. These are the most common operations that can be performed on objects in the Leverege Stack |

## Roles

Essentially, a role is a collection of permissions that you can apply to users. Using roles makes it easier to add, remove, and adjust permissions than assigning permissions to users individually. As your user base increases in scale and complexity, roles become particularly useful.

You can also use roles to collect permissions defined for various APIs. For example, say you have a third-party tool that tracks your barn equipment. Your barn equipment API role could have a `Create equipment in a location` &  `Update equipment in a location` permissions allow the API to create and update equipment in our database.


## User Roles

User Roles represent bindings between a user ID, role ID, and resource ID. As an example, a user role represents “giving Steve (User ID) the ability to act as a Farm Hand (Role ID) at Eric’s Farm (Resource ID)”. 
