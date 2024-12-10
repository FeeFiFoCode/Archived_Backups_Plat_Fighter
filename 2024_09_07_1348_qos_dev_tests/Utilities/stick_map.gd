extends Node
class_name StickMap

#var regionDeadzone = Region.new(Vector2(-0.2750,-0.6500), Vector2(0.2750,0.6500) )
#var regionWalkSlow = Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500))



#var regionTiltTurn = Region.new(Vector2(-0.7875,-0.6500), Vector2(-0.2875,0.6500))
#
#var regionDash = Region.new(Vector2(0.8000,-0.6500),Vector2(1.000,0.6500))
#var regionDashBack = Region.new(Vector2(-1.000,-0.6500),Vector2(-0.8000,0.6500))
#
#var regionJumpSquat = Region.new(Vector2(-1.000,0.6625),Vector2(1.000,1.000))
#var regionSquat = Region.new(Vector2(-0.7875,-1.000),Vector2(0.7875,-0.6625))

#enum MapName
#{
#	DEADZONE,
#	IDLE
#}
#
# Left Stick - LS

#var test = "hello"

var LeftStick = {
	"Idle":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500)),
			"Dash":Region.new(Vector2(0.8000,-0.6500), Vector2(1.0000,0.6500)),
		},
		
	"WalkSlow":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},
	"WalkMid":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},
	"WalkFast":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},
	"WalkBack":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},

	"Teeter":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},

	"TeeterBack":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500))
		},
		
	"Fall":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500))
		},

	"Landing":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"Idle": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500)),
			"Dash":Region.new(Vector2(0.8000,-0.6500), Vector2(1.0000,0.6500)),
		},
		
	"TurnTilt":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500)),
			"WalkBack":Region.new(Vector2(-0.4000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.4125,0.6500))
		},
	"TurnSmash":
		{},
	"TurnRun":
		{},
	"PassPlat":
		{},
	"Skid":
		{},
	"FallFast":
		{},
	"FallFastSuper":
		{},
	"LandHeavy":
		{},
	"JumpSquat":
		{},
	"JumpShortFwd":
		{},
	"JumpShortBack":
		{},
	"JumpShortNeutral":
		{},
	"JumpFullFwd":
		{},
	"JumpFullBack":
		{},
	"JumpFullNeutral":
		{},
	"JumpSuperFwd":
		{},
	"JumpSuperBack":
		{},
	"JumpSuperNeutral":
		{},
	"JumpChargedFwd":
		{},
	"JumpChargedBack":
		{},
	"JumpChargedNeutral":
		{},
	"Squat":
		{},
	"SquatReverse":
		{},
	"SquatWait":
		{},
	"CrawlFwd":
		{},
	"CrawlBack":
		{},
	"Shield":
		{},
	"ShieldRelease":
		{},
	"ShieldWait":
		{},
	"RollFwd":
		{},
	"RollBack":
		{},
	"AirDodgeFwd":
		{},
	"AirDodgeBack":
		{},
	"AirDodgeNeutral":
		{},
	"AirDashFwd":
		{},
	"AirDashBack":
		{},
	"AirDashNeutral":
		{},
	"MetaWalk":
		{},
	"MetaRun":
		{},
	"MetaDash":
		{},
	"MetaJump":
		{},
	"MetaFall":
		{},
	"MetaLand":
		{},
	"MetaRoll":
		{},
	"MetaTurn":
		{},
	"MetaAirDodge":
		{},
	"MetaAirDash":
		{},
	"Dash":
		{},
	"Run":
		{},
	"DashBack":
		{},
	"DashSun":
		{},
	"DashMoon":
		{},
	"DashSticky":
		{},
	"DashCharged":
		{},
	"DashSuper":
		{},
	"RunSun":
		{},
	"RunMoon":
		{},
	"RunSticky":
		{},
	"RunCharged":
		{},
	"RunSuper":
		{},
	"WalkSun":
		{},
	"WalkMoon":
		{},
	"WalkSticky":
		{},
	"WalkCharged":
		{},
	"WalkSuper":
		{},
}
#var LS
