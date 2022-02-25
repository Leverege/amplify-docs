# Routing

Routing defines on which page a user of a particular role lands when they first log in.

## Adding Routing on User Login

To set on which page a user of a particular role lands when they first log in:

1. Navigate to the **Permissions > Roles** page in Architect
1. Select the role to configure
1. In the panel on the right, click the **Edit** button next to the **Metadata** section to open up a dialog box
1. Enter in a JSON object in the metadata structured like the following:

    ``` json
    {
      "ui": {
        "defaultUrl": {
          "type": "urlPathRoleCalculator",
          "single": "/p/[persona]/[blueprint]/:resourceId",
          "multiple": "/p/[persona]/[blueprint]",
          "resourceType": "[blueprintId]"
        }
      }
    }
    ```

1. Input the following fields:
    1. **Type**: set to be **urlPathRoleCalculator**
    1. **Single**: defines if the user only has access to a single resource of the given resource type (e.g. if the user has access to only one location)
        1. **Persona** - name of the role to configure
        1. **Blueprint** - the blueprint name for the page to which to navigate
        1. **:resourceId** - leave as-is, as this specifies that the system should navigate to the single available resource
    1. **Multiple**: defines if the user has access to multiple resources of the given resource type (e.g. if the user has access to multiple locations)
        1. **Persona** - name of the role to configure
        1. **Blueprint** - the blueprint name for the page to which to navigate
    1. **ResourceType**: the blueprint ID of the blueprint name specified earlier. This can be found by going to **Blueprints > [Blueprint Name] > Info**
1. . Make sure any blueprints referenced in this routing config have the `is:root tag` applied. If not, add it in the tag field in **Blueprints > [Blueprint Name] > Info**

Below is an example metadata used for role called Admin (named `admin`). It routes users on login into the single company if they only have access to one company, or to a list of company if they have access to multiple companies:

``` json
{
  "ui": {
    "defaultUrl": {
      "type": "urlPathRoleCalculator",
      "single": "/p/admin/company/:resourceId",
      "multiple": "/p/admin/company",
      "resourceType": "5MCUDvbtjFYMlI9sCAcgXJ"
    }
  }
}
```

!!! Tip "Specifying default screen within a page"
    Users can also specify the default screen that a user should arrive it when they are routed to a specific page. This can be done by applying the `is:preferredView` tag in the attribute of the parent blueprint that the user should arrive at by default.