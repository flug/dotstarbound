---{ Upgraded Mech }--- MOD

This mod will upgrade you mech instant.No need to craft/build.

Installation:
1.Just place the mods to your mods files (*Steam Location*/SteamApps/common/Starbound/mods)

If this doesnt work try this:
1.Go to your mech file in the Starbound folder (Starbound/assets/tech/mech/humanmech)
2.Open the humanmech.tech with Notepad or Notepad++
3.There should have:

{
  "script" : "/tech/mech/mech.lua",
  "actions" : [ "mechActivate", "mechDeactivate" ],
  "animator" : "humanmech.animation",

  "mechCustomMovementParameters" : {
    "standingPoly" : [ [-3.5, -2.0], [-2, -4.5], [2, -4.5], [3.5, -2.0], [3.5, 2], [2, 3], [-2, 3], [-3.5, 2] ],
    "crouchingPoly" : [ [-3.5, -2.0], [-2, -4.5], [2, -4.5], [3.5, -2.0], [3.5, 2], [2, 3], [-2, 3], [-3.5, 2] ],

    "mass" : 5.0,

    "normalGroundFriction" : 50.0,
    "ambulatingGroundFriction" : 6.0,
    "skiddingGroundFriction" : 10.0,

    "groundForce" : 160.0,
    "airForce" : 50.0,
    "liquidForce" : 70.0,

    "walkSpeed" : 5.0,
    "runSpeed" : 14.0,

    "airJumpProfile" : {
      "jumpSpeed" : 20.0,
      "jumpControlForce" : 800.0,
      "jumpInitialPercentage" : 0.75,
      "jumpHoldTime" : 0.25
    },

    "liquidJumpProfile" : {
      "jumpSpeed" : 8.0,
      "jumpControlForce" : 400.0,
      "jumpInitialPercentage" : 0.75,
      "jumpHoldTime" : 0.1
    }
  },

  "energyCostPerSecond" : 30,

  "mechTransformPositionChange" : [0.0, 2.0],
  "parentOffset" : [2.0, 1.2],

  "mechCollisionTest" : [-3.5, -2.5, 3.5, 5],

  "mechAimLimit" : 70,

  "mechFireCycle" : 0.09,
  "mechProjectile" : "bullet-4",
  "mechProjectileConfig" : {
    "power" : 70  }
}


Copy and replace this to your humanmech.tech (WARNING:HAVE A BACKUP FIRST!!(incase your game crash)

(OPTIONAL)If you want the new texture of the new human mech go to the mods folder then copy the humanmechgun.png and humanmechbody.png to your assets/tech/mech/humanmech then replace it with the new one

That's all....

In this mod:
1.It will upgrade your mech speed (walk,run)
2.It will upgrade your mech firerate
3.It will upgrade your mech jump
4.It will upgrade your mech damage
5.It will allow you to aim up and down without limit
6.It will change the look of your mech

Future:
1.Increase damage (DONE)
2.Increase aim limit (DONE)
3.Increase speed

Version History:V.1=Initial Release,V.2=Slightly Increase damage and speed,V.3=Lower firerate but increase more damage,speed,legs cycle and aim limit,V.3a=Added new look of the mech

Source:Steam

IM NOT RESPONSIBLE FOR ANY CRASH

Compatible for Angry Koala only

Enjoy!

Give me a suggestion if there bugs or something (sorry for my bad english)