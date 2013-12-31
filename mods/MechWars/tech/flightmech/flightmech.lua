function init()
  data.active = false
  data.fireTimer = 0
  tech.setVisible(false)
  tech.rotateGroup("guns", 0, true)
  data.holdingUp = false
  data.holdingDown = false
  data.walking = false
  data.left = false
  data.right = false
  data.holdingJump = false
end

function uninit()
  if data.active then
    local mechTransformPositionChange = tech.parameter("mechTransformPositionChange")
    tech.translate({-mechTransformPositionChange[1], -mechTransformPositionChange[2]})
    tech.setParentOffset({0, 0})
    data.active = false
    tech.setVisible(false)
    tech.setParentAppearance("normal")
    tech.setToolUsageSuppressed(false)
    tech.setParentFacingDirection(nil)
  end
end

function input(args)
 if args.moves["up"] then
    data.holdingUp = true
  elseif not args.moves["up"] then
    data.holdingUp = false
  end
  
  if args.moves["down"] then
    data.holdingDown = true
  elseif not args.moves["down"] then
    data.holdingDown = false
  end
  
   if args.moves["jump"] then
    data.holdingJump = true
  elseif not args.moves["jump"] then
    data.holdingJump = false
  end
  
  if args.moves["left"] or args.moves["right"] then
    data.walking = true
  else
    data.walking = false
  end
  if args.moves["left"] then
    data.left = true
  else
    data.left = false
  end
  if args.moves["right"] then
    data.right = true
  else
    data.right = false
  end
  if args.moves["special"] == 1 then
    if data.active then
      return "mechDeactivate"
    else
      return "mechActivate"
    end
  elseif args.moves["primaryFire"] then
    return "mechFire"
  end

  return nil
end

function update(args)
  local energyCostPerSecond = tech.parameter("energyCostPerSecond")
  local mechCustomMovementParameters = tech.parameter("mechCustomMovementParameters")
  local mechTransformPositionChange = tech.parameter("mechTransformPositionChange")
  local parentOffset = tech.parameter("parentOffset")
  local mechCollisionTest = tech.parameter("mechCollisionTest")
  local mechAimLimit = tech.parameter("mechAimLimit") * math.pi / 180
  local mechFrontRotationPoint = tech.parameter("mechFrontRotationPoint")
  local mechFrontFirePosition = tech.parameter("mechFrontFirePosition")
  local mechBackRotationPoint = tech.parameter("mechBackRotationPoint")
  local mechBackFirePosition = tech.parameter("mechBackFirePosition")
  local mechFireCycle = tech.parameter("mechFireCycle")
  local mechProjectile = tech.parameter("mechProjectile")
  local mechFireCost = tech.parameter("mechFireCost")
  local mechProjectileConfig = tech.parameter("mechProjectileConfig")

  if not data.active and args.actions["mechActivate"] then
    mechCollisionTest[1] = mechCollisionTest[1] + tech.position()[1]
    mechCollisionTest[2] = mechCollisionTest[2] + tech.position()[2]
    mechCollisionTest[3] = mechCollisionTest[3] + tech.position()[1]
    mechCollisionTest[4] = mechCollisionTest[4] + tech.position()[2]
    if not world.rectCollision(mechCollisionTest) then
      tech.burstParticleEmitter("mechActivateParticles")
      tech.translate(mechTransformPositionChange)
      tech.setVisible(true)
      tech.setParentAppearance("sit")
      tech.setToolUsageSuppressed(true)
      data.active = true
    else
      -- Make some kind of error noise
    end
  elseif data.active and (args.actions["mechDeactivate"] or energyCostPerSecond * args.dt > args.availableEnergy) then
    tech.burstParticleEmitter("mechDeactivateParticles")
    tech.translate({-mechTransformPositionChange[1], -mechTransformPositionChange[2]})
    tech.setVisible(false)
    tech.setParentAppearance("normal")
    tech.setToolUsageSuppressed(false)
    tech.setParentOffset({0, 0})
    data.active = false
  end

  tech.setParentFacingDirection(nil)
  if data.active then
    local diff = world.distance(args.aimPosition, tech.position())
    local aimAngle = math.atan2(diff[2], diff[1])
    local flip = aimAngle > math.pi / 2 or aimAngle < -math.pi / 2

    tech.applyMovementParameters(mechCustomMovementParameters)
    if flip then
      tech.setFlipped(true)
      local nudge = tech.stateNudge()
      tech.setParentOffset({-parentOffset[1] - nudge[1], parentOffset[2] + nudge[2]})
      tech.setParentFacingDirection(-1)

      if aimAngle > 0 then
        aimAngle = math.max(aimAngle, math.pi - mechAimLimit)
      else
        aimAngle = math.min(aimAngle, -math.pi + mechAimLimit)
      end

      tech.rotateGroup("guns", math.pi - aimAngle)
    else
      tech.setFlipped(false)
      local nudge = tech.stateNudge()
      tech.setParentOffset({parentOffset[1] + nudge[1], parentOffset[2] + nudge[2]})
      tech.setParentFacingDirection(1)

      if aimAngle > 0 then
        aimAngle = math.min(aimAngle, mechAimLimit)
      else
        aimAngle = math.max(aimAngle, -mechAimLimit)
      end

      tech.rotateGroup("guns", aimAngle)
    end
 
   
   if not tech.onGround() then
     if data.active and data.holdingUp and data.right then
	    tech.yControl(tech.parameter("VerticalSpeed"), 1000, true)
		tech.xControl(tech.parameter("HorizontalSpeed"), 1000, true)
		tech.setAnimationState("movement", "jump")
	  elseif data.active and data.holdingUp and data.left then
	    tech.yControl(tech.parameter("VerticalSpeed"), 1000, true)
		tech.xControl(-tech.parameter("HorizontalSpeed"), 1000, true)
		tech.setAnimationState("movement", "jump")
      elseif data.active and data.holdingJump and data.right then
	    tech.yControl(tech.parameter("HoverSpeed"), 1000, true)
		tech.xControl(tech.parameter("HorizontalSpeed"), 1000, true)
		tech.setAnimationState("movement", "jump")
	  elseif data.active and data.holdingJump and data.left then
	    tech.yControl(tech.parameter("HoverSpeed"), 1000, true)
	    tech.xControl(-tech.parameter("HorizontalSpeed"), 1000, true)
		tech.setAnimationState("movement", "jump")
      elseif data.active and data.holdingUp then
		tech.yControl(tech.parameter("VerticalSpeed"), 1000, true)
        tech.setAnimationState("movement", "jump")
	  elseif data.active and data.holdingJump then
		tech.yControl(tech.parameter("HoverSpeed"), 1000, true)
        tech.setAnimationState("movement", "jump")
      else
        tech.setAnimationState("movement", "fall")
      end
	elseif tech.walking() or tech.running() then
      if flip and tech.direction() == 1 or not flip and tech.direction() == -1 then
        tech.setAnimationState("movement", "backWalk")
      else
        tech.setAnimationState("movement", "walk")
      end
    else
      tech.setAnimationState("movement", "idle")
    end
    
	local cost = energyCostPerSecond * args.dt
    if args.actions["mechFire"] and cost + mechFireCost <= args.availableEnergy then
      if data.fireTimer <= 0 then
	    cost = cost + mechFireCost
        world.spawnProjectile(mechProjectile, tech.anchorPoint("frontGunFirePoint"), tech.parentEntityId(), {math.cos(aimAngle), math.sin(aimAngle)}, false, mechProjectileConfig)
        data.fireTimer = data.fireTimer + mechFireCycle
        tech.setAnimationState("frontFiring", "fire")
      else
        local oldFireTimer = data.fireTimer
        data.fireTimer = data.fireTimer - args.dt
        if oldFireTimer > mechFireCycle / 2 and data.fireTimer <= mechFireCycle / 2 and cost + mechFireCost <= args.availableEnergy then
          world.spawnProjectile(mechProjectile, tech.anchorPoint("backGunFirePoint"), tech.parentEntityId(), {math.cos(aimAngle), math.sin(aimAngle)}, false, mechProjectileConfig)
		  cost = cost + mechFireCost
          tech.setAnimationState("backFiring", "fire")
        end
      end
    end

    return cost
  end

  return 0
end
