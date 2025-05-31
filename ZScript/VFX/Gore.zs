Class GibGenerator : Actor
{
   Default{
	+FORCEXYBILLBOARD;
   }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_StartSound("amputate",1);
	TNT1 A 0 A_CheckSightOrRange(1000,"LessGibs");
	TNT1 AA 0 A_SpawnItemEx("KuroBloodCloud",frandom(-3,3),frandom(-3,3),frandom(20,40),frandom(-0.3,0.3),frandom(-0.3,0.3),frandom(-0.3,0.3),0,SXF_TRANSFERTRANSLATION);
	TNT1 AAAAAA 0 
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	TNT1 AAAAAAAAAAA 1
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		}
	Stop;
  LessGibs:
	TNT1 AAAAAA 2 A_SpawnItemEx("KuroGib",0,0,random(10,50),frandom(2,6),0,frandom(2,8),random(0,360),SXF_TRANSFERTRANSLATION);
	Stop;
	}
}

Class SmallGibGenerator : GibGenerator
{
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_CheckSightOrRange(1000,"LessGibs");
	TNT1 A 0 A_SpawnItemEx("KuroBloodCloud",frandom(-3,3),frandom(-3,3),frandom(20,40),frandom(-0.3,0.3),frandom(-0.3,0.3),frandom(-0.3,0.3),0,SXF_TRANSFERTRANSLATION);
	TNT1 AAAA 0 
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	TNT1 AAAA 1
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		}
	Stop;
  LessGibs:
	TNT1 AA 2 
		{
		A_SpawnItemEx("KuroGib",0,0,random(10,50),frandom(2,6),0,frandom(2,8),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	Stop;
	}
}

Class BossGibGenerator : GibGenerator
{
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_CheckSightOrRange(1000,"LessGibs");
	TNT1 A 0 A_SpawnItemEx("KuroBloodCloud",frandom(-18,18),frandom(-18,18),frandom(20,80),frandom(-0.5,0.5),frandom(-0.5,0.5),frandom(-0.5,0.5),0,SXF_TRANSFERTRANSLATION);
	TNT1 AAAAA 0 
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),0,frandom(4,60),frandom(4,12),0,frandom(5,15),random(0,360),SXF_TRANSFERTRANSLATION);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),0,frandom(4,60),frandom(4,12),0,frandom(5,15),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	TNT1 AAAAA 1
		{
		A_SpawnItemEx("KuroGib",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		}
	Stop;
  LessGibs:
	TNT1 AA 2
		{
		A_SpawnItemEx("KuroGib",random(0,25),0,random(10,90),frandom(2,6),0,frandom(2,8),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	Stop;
	}
}

Class SubtractGibGenerator : GibGenerator
{
  Default
  {
  Renderstyle "Subtract";
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay A_StartSound("amputate",1);
	TNT1 A 0 A_CheckSightOrRange(1000,"LessGibs");
	TNT1 AA 0 A_SpawnItemEx("KuroBloodCloudSubtract",frandom(-3,3),frandom(-3,3),frandom(20,40),frandom(-0.3,0.3),frandom(-0.3,0.3),frandom(-0.3,0.3),0,SXF_TRANSFERTRANSLATION);
	TNT1 AAAAAAAAAA 0 
		{
		A_SpawnItemEx("KuroGibSubtract",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),0,frandom(4,60),frandom(4,8),0,frandom(5,10),random(0,360),SXF_TRANSFERTRANSLATION|SXF_TRANSFERRENDERSTYLE);
		}
	TNT1 AAAAAAAAAAAAAAA 1
		{
		A_SpawnItemEx("KuroGibSubtract",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY);
		A_SpawnItemEx("KuroFlyingBlood",frandom(-10,10),frandom(-10,10),frandom(4,60),vel.x*2+frandom(-5,5),vel.y*2+frandom(-5,5),vel.z*2+frandom(-2,20),random(0,360),SXF_TRANSFERTRANSLATION|SXF_ABSOLUTEVELOCITY|SXF_TRANSFERRENDERSTYLE);
		}
	Stop;
  LessGibs:
	TNT1 AAAAAA 2 A_SpawnItemEx("KuroGibSubtract",0,0,random(10,50),frandom(2,6),0,frandom(2,8),random(0,360),SXF_TRANSFERTRANSLATION);
	Stop;
	Stop;
	}
}

Class KuroGib : Actor
{
  Default
  {
  Radius 5;
  Height 10;
  Scale 0.6;
  Mass 200;
  /*BounceType "Hexen";
  BounceFactor 0.3;
  WallBounceFactor 0.3;
  BounceCount 4;*/
  BounceType "Doom";
  BounceFactor 0.5;
  WallBounceFactor 0.5;
  BounceCount 6;
  Gravity 1.2;
  BounceSound "gibsplat";
  Projectile;
  +USEBOUNCESTATE;
  -NOGRAVITY;
  //+CORPSE;
  +ROLLSPRITE;
  +THRUACTORS;
  +MOVEWITHSECTOR;
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay 
		{
		frame = random(0,7);
		A_SetRoll(random(0,360));
		}
	GIBL "#" 1 
		{
		if(vel.z == 0)
			SetStateLabel("Death");
		A_SetRoll(roll+15);
		A_SpawnItemEx("KuroBloodCloudSmall",0,0,0,frandom(0,1),0,frandom(-1,1),random(0,360),SXF_TRANSFERTRANSLATION);
		}
	Wait;
  Death:
  Crash:
	GIBL "#" 1500 
		{
		A_SetRoll(0);
		A_Stop();
		A_StartSound("gibsplat");
		}
	GIBL # 20 A_FadeOut(0.1);
	Goto Crash+1;
	}
}

Class KuroGibSubtract : KuroGib
{
  Default
  {
  Renderstyle "Subtract";
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay 
		{
		frame = random(0,7);
		A_SetRoll(random(0,360));
		}
	GIBL "#" 1 
		{
		if(vel.z == 0)
			SetStateLabel("Death");
		A_SetRoll(roll+15);
		A_SpawnItemEx("KuroBloodCloudSmall",0,0,0,frandom(0,1),0,frandom(-1,1),random(0,360),SXF_TRANSFERTRANSLATION|SXF_TRANSFERRENDERSTYLE);
		}
	Wait;
	}
}

Class KuroBloodCloud : Actor
{
  Default
  {
  +NOINTERACTION;
  +ROLLSPRITE;
  Scale 2.5;
  Renderstyle "Translucent";
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay
		{
		A_SetRoll(random(0,360));
		A_SetScale(Scale.X+frandom(-0.3,0.3));
		}
	BLC0 AAAABBBBCCCCDDDDEEEEFFFFGGGG 1 A_FadeOut(0.025);
	Stop;
	}
}

Class KuroBloodCloudSubtract : KuroBloodCloud { Default { Renderstyle "Subtract"; } }

Class KuroBloodCloudSmall : KuroBloodCloud
{
  Default
  {
  Scale 0.4;
  Alpha 0.6;
  }
  States
  {
  Spawn:
	TNT1 A 0 NoDelay
		{
		A_SetRoll(random(0,360));
		A_SetScale(Scale.X+frandom(-0.1,0.1));
		}
	BLC0 AABBCCDDEEFFGG 1 A_FadeOut(0.05);
	Stop;
	}
}

Class VerySatisfyingSquish : RealGibs
{
  Default
  {
  Scale 0.9;
  }
  States
  {
  Spawn:
	TNT1 A 0;
	CRS2 A -1 A_StartSound("gibcrush",1);
    Stop;
    }
}

Class GenericAmputatedGib : Actor
{
  Default
  {
  Radius 8;
  Height 8;
  BounceType "Doom";
  BounceFactor 0.5;
  SeeSound "amputate";
  BounceSound "gibsplat";
  DeathSound "gibsplat";
  +DROPOFF;
  +ROLLSPRITE;
  +ROLLCENTER;
  +MISSILE;
  }
}