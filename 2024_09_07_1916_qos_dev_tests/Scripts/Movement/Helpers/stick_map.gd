extends Node
class_name StickMap


var LeftStick = {
	"Idle":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"Dash":Region.new(Vector2(0.8000,-0.6500), Vector2(1.0000,0.6500)),
			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},

	"WalkSlow":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},
	"WalkMid":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},
	"WalkFast":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},
	"WalkBack":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},

	"Teeter":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},

	"TeeterBack":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.4000,0.6500)),
			"WalkMid":Region.new(Vector2(0.4125,-0.6500), Vector2(0.8000,0.6500)),
			"WalkFast":Region.new(Vector2(0.8125,-0.6500), Vector2(1.000,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
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
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
			"Dash":Region.new(Vector2(0.8000,-0.6500), Vector2(1.0000,0.6500)),
		},

	"TurnTilt":
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6500), Vector2(0.2750,0.6500) ),
			"WalkSlow":Region.new(Vector2(0.2875,-0.6500), Vector2(0.7875,0.6500)),
			"WalkBack":Region.new(Vector2(-0.6000,-0.6500), Vector2(-0.2125,0.6500)),
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6500), Vector2(-0.6125,0.6500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6500), Vector2(-0.8125,0.6500)),
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
	"MetaLanding":
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
		{
			"Deadzone": Region.new(Vector2(-0.2000,-0.6875), Vector2(0.2750,0.5500) ),
			"Idle": Region.new(Vector2(-0.2000,-0.6875), Vector2(0.2750,0.5500) ),
			
			"Sun": Region.new(Vector2(-0.2000,-0.6875), Vector2(0.2750,0.5500) ),
			"Moon":Region.new(Vector2(-1.0000,-0.6875), Vector2(-0.2125,0.5500)),
			
			"WalkSlow":Region.new(Vector2(0.2875,-0.6875), Vector2(0.6125,0.5500)),
			"WalkSun":Region.new(Vector2(0.2875,-0.6875), Vector2(0.6125,0.5500)),
			
			"WalkBack":Region.new(Vector2(-0.6000,-0.6875), Vector2(-0.2125,0.5500)),
			"WalkMoon":Region.new(Vector2(-0.6000,-0.6875), Vector2(-0.2125,0.5500)),

			
			"Dash":Region.new(Vector2(0.8000,-0.6875), Vector2(1.0000,0.5500)),
			"DashSun":Region.new(Vector2(0.8000,-0.6875), Vector2(1.0000,0.5500)),
			"DashMoon":Region.new(Vector2(-1.0000,-0.6875), Vector2(-0.8000,0.5500)),
			"DashSticky": Region.new(Vector2(-0.2000,-0.6875), Vector2(0.2750,0.5500) ),
			"DashBack":Region.new(Vector2(-1.0000,-0.6875), Vector2(-0.8125,0.5500)),
			
			"Run":Region.new(Vector2(0.6250,-0.6875), Vector2(1.0000,0.5500)),
			"RunSun":Region.new(Vector2(0.6250,-0.6875), Vector2(1.0000,0.5500)),
			"RunMoon":Region.new(Vector2(-1.000,-0.6875), Vector2(-0.6250,0.5500)),
			
			"TurnTilt":Region.new(Vector2(-0.8000,-0.6875), Vector2(-0.6125,0.5500)),
			"TurnSmash":Region.new(Vector2(-1.0000,-0.6875), Vector2(-0.8125,0.5500)),

			"JumpSquat":Region.new(Vector2(-1.0000,1.0000), Vector2(1.0000,1.0000)),
			"Squat":Region.new(Vector2(-1.0000,-1.0000), Vector2(1.0000,-0.7000)),
		},
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
	"PatternWalk":
		{},
}
