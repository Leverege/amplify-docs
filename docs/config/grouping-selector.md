# Grouping Selector

A grouping selector is a UI component that applies exclusivity/filtering to data. After defining groups in configuration, selecting those groups in the UI results in the rendering of that specific group’s data in the map and/or table. 

A grouping selector will also show the count of devices that are in each group. For example, assets in an indoor facility may be grouped by floors.

[Screenshot of grouping selector]

## Adding a Grouping Selector

To add a grouping selector to the UI, select it from the layout controller. The grouping selector can occupy any of the outside sections of the page layout.


## Configuring the Grouping Selector

The appearance of a grouping selectors is based on the metadata in the root blueprint where all groupings should be viewed. For example, to set grouping of `assets` by `floor` at a `location`, the metadata for groupings is set in the `location` blueprint.

Grouping metadata can be set by power users but are more typically composed by engineers. Refer to the groupings described in the developer documention for more information.