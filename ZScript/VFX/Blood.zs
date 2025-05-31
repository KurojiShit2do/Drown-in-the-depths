Class KuroBlood : Actor replaces Blood
{
  Default
  {
  +NOBLOCKMAP;
  +NOTELEPORT;
  }
  States
  {
  Spawn:
	TNT1 A 1 NoDelay A_SpawnItemEx("KuroFlyingBlood",0,0,0,frandom(2,4),0,frandom(2,5),random(0,360),SXF_NOCHECKPOSITION|SXF_TRANSFERTRANSLATION|SXF_TRANSFERRENDERSTYLE);
	Stop;
	}
}

Class KuroBloodSubtract : KuroBlood { Default { Renderstyle "Subtract"; } }

Class KuroFlyingBlood : Actor
{
  Default
  {
  Scale 0.6;
  Radius 3;
  Height 4;
  Mass 200;
  Gravity 1.2;
  Renderstyle "Translucent";
  Alpha 0.75;
  +CORPSE;
  +NOTELEPORT;
  +NOBLOCKMAP;
  +THRUACTORS;
  +CLIENTSIDEONLY;
  +DONTSPLASH;
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_CheckSightOrRange(2000,"Null");
	FBLD AABBCCDD 1 A_SpawnItemEx("KuroFlyingBloodTrail",frandom(-0.25,0.25),0,frandom(-0.25,0.25),frandom(-0.5,0.5),0,frandom(-0.5,0.5),random(0,360),SXF_TRANSFERTRANSLATION|SXF_TRANSFERRENDERSTYLE);
	Loop;
  Crash:
	TNT1 A 1 
		{
		A_StartSound("bloodsplat",1);
		A_SpawnItemEx("KuroBloodSpot",0,0,0,0,0,0,0,SXF_TRANSFERTRANSLATION|SXF_TRANSFERRENDERSTYLE);
		}
	Stop;
	}
}

Class KuroBloodSpot : Actor
{
  Default
  {
  Scale 0.85;
  Renderstyle "Translucent";
  Alpha 0.5;
  +CLIENTSIDEONLY;
  +NOBLOCKMAP;
  +DONTSPLASH;
  +MOVEWITHSECTOR;
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay { frame = random(0,3); }
	BSPT "#" 1500 A_JumpIf(waterlevel >= 1,"null");
	BSPT "#" 20 A_FadeOut(0.1);
	Wait;
	}
}

Class KuroFlyingBloodTrail : Actor
{
  Default
  {
  Scale 0.6;
  +LOWGRAVITY;
  +NOBLOCKMAP;
  +CLIENTSIDEONLY;
  +DONTSPLASH;
  Renderstyle "Translucent";
  Alpha 0.75;
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_CheckSightOrRange(2000,"Null");
	BLUD CCBBAA 1 A_FadeOut(0.03);
	Stop;
	}
}