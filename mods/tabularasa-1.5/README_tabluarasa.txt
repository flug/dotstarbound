=== TABULA RASA V1.5 ===

By:         LowestFormOfWit and SnoopJeDi (snoopjedi@gmail.com)

License:
This work is licensed under the Creative Commons Attribution 3.0 United States License. To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/us/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

Basically, as long as you give us credit, link to the Creative Commons license, and indicate any changes (all of which can be done in a readme file), you can do whatever you want with this mod.


== DESCRIPTION ==

The Tabula Rasa is designed to be a unified crafting bench for mod content.
Modders can tag their recipes with "mod" to add it to the tablet, allowing players to access the additional content without player.config patches.

Note that the Tabula Rasa will display any associated recipes regardless of whether the blueprint is known, so it is a poor choice for progression-driven content where the modder wants recipes to 'unlock' as the player progresses.  You can, however, design your recipes so that the ability to craft is limited to certain tiers.  This mod instead focuses primarily on helping others share their creations.

We have tested this version of the mod with v. Angry Koala, although it should remain compatible with the game in future versions.

NOTE: bootstrap.config files modified with the old method will still work with v. Offended Koala, but we urge people using the Tabula Rasa to update their installation method to the .modinfo system to ensure maximum forward compatibility.


== INSTALLATION & USAGE ==
(see also installation.png)

1. Extract "TabulaRasaV1.5.zip" into the main Starbound folder.
2. Verify that the "tabularasa1.5" folder is in the 'Starbound/mods' directory. If not, you may have extracted the archive to the wrong folder.
3. Once the folder has been placed correctly, launch Starbound. 
4. On any character, open the personal crafting menu (default 'c'), and craft the Tabula Rasa for a cost of 1 pixel. 
5. Place the tablet in the game world.  It can now be used to craft any recipes that include "mod" in their group list. 
	5a. If you have no recipes tagged "mod", nothing will show up here. We have included an additional example item that you can tag with "mod" to test for yourself!

== HOW TO USE THE TABULA RASA ==

1. Add the "mod" keyword to the recipe group list. 
1a. For example: to make the 'stonepickaxe' item, change this line in 'stonepickaxe.recipe':

		"groups" : [ "craftingtable", "tools", "all" ]
	To:
		"groups" : [ "mod", "craftingtable", "tools", "all" ]

2. That's it!

Items with the "mod" tag will still be craftable on other objects if the group keyword is set correctly, but may not show up in the interface if the blueprint for them is not known.  This is the key difference - the Tabula Rasa will show any item associated with it, regardless of whether the player knows the blueprint for it, which obviates the need for changes to player.config.  Of course, now with the __merge system (see http://community.playstarbound.com/index.php?threads/overriding-and-merging-config-files-in-mods.53775/), this problem can be gotten around in other methods.  However, we will continue to update Tabula Rasa to provide a way for mod authors to allow their mods to be organized on a unified interface.

The 'imperfectlygenericitem' item and recipe are included with the tablet to provide an additional example of use. 
To use this example, open "imperfectlygenericitem.recipe" found in the "recipes" folder of this mod. Add "mod" to the 'groups' line and voila!

== COMPATABILITY ==
  
If you would like Tabula Rasa to be -required- to run your mod (as opposed to optional), make sure your .modinfo file lists Tabula Rasa as a dependency. 
 
Thanks to SpiderDave of ##starbound-modding, we have in this version included several different .modinfo files that serve as a workaround to dependency versioning.  This version is backwards compatible with 1.1-1.4, so any mods that previously depended on those versions will continue to work if 1.5 is the only copy of the mod installed.  This leaves us breathing room in case something major changes that breaks compatibility in the future.

== CHANGELOG ==
1.5 - __merge integration, recipe changed to plain, 1 pixel.  Dependency versioning workaround implemented.  Tablet can no longer be crafted on itself.
1.4 - Stopgap update to make Tabula Rasa immediately available for Angry Koala
1.3 - Minor grammatical errors and frame errors fixed. Graphic updated. Imperfectly Generic Item made as an optional additional example. Duplicate Tabula Rasas crafted from a Tabula Rasa now cost 1 pixel instead of additonal torches.
1.2 - Re-upload of 1.1 due to technical problems. Identical to 1.1.
1.1 - Updated installation to use new mod system
1.0 - Initial version.
