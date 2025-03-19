class KurojiWeapon : Weapon {
    
    float offsetrngx;
    float offsetrngy;

    int WeaponMagMax;
    int WeaponMagCount;
    property MagazineSize: WeaponMagMax;

    action void A_SetOffsetVariables(float xfloat, float yfloat) {
        invoker.offsetrngx = xfloat;
        invoker.offsetrngy = yfloat;
	}

    action void A_RandomWeaponOffset(float xfloat = 0, float yfloat = 0) {
        if(xfloat == 0 && yfloat == 0)
            A_WeaponOffset(invoker.offsetrngx,invoker.offsetrngy,WOF_ADD|WOF_INTERPOLATE);
        else
            A_WeaponOffset(xfloat,yfloat,WOF_ADD|WOF_INTERPOLATE);
	}

    action void A_WeaponOffsetReset() {
	    A_WeaponOffset(0,32,WOF_INTERPOLATE);
	}

    action void setup(int max){
        invoker.WeaponMagMax = max;
        invoker.WeaponMagCount = max;
    }
}

class KurojiBulletPuff : BulletPuff {
    static const string PuffColor[] = {
        "FFFFFF",
        "B9B9B9",
        "939393",
        "818181",
        "5F5F5F",
        "474747",
        "373737",
        "FFF300",
        "FFB900"
    };
    Default {
		Alpha 1;
		VSpeed 0;
        Scale 0.25;
	}
	States {
        Spawn:
            PUFF A 4 Bright;
            TNT1 A 0 {
                for(int i = 0; i < 5; i++){
                    A_SpawnParticle(PuffColor[random(0,8)],                 //Color
                                    SPF_FULLBRIGHT,                         //Flags
                                    random(5,15),                           //Lifetime
                                    frandom(3,8),                           //Size
                                    0,                                      //Angle
                                    0,0,0,                                  //XYZ offset
                                    0, frandom(-2,2), frandom(0,10),        //XYZ vel
                                    0, 0, -1);
                }
            }
            PUFF B 4;
            Stop;
	}
}

class ParticlePlasmaFire : Actor
{
	Default
	{
		+NOINTERACTION
		+NOBLOCKMAP
		radius 16;
	}

	override void Tick()
	{
		super.Tick();
		if (isFrozen())
			return;
		
		FSpawnParticleParams fp;
		fp.texture = TexMan.CheckForTexture('PLSSB0');
		fp.flags = SPF_FULLBRIGHT|SPF_ROLL|SPF_REPLACE;
		fp.color1 = "";
		for (int i = 5; i > 0; i--)
		{
			fp.lifetime = random[fp](40, 80);
			
			fp.pos.x = pos.x + frandom[fp](-radius, radius);
			fp.pos.y = pos.y + frandom[fp](-radius, radius);
			fp.pos.z = pos.z + frandom[fp](0, 16);
			
			fp.vel.xy = (frandom[fp](-2, 2), frandom[fp](-2, 2));
			fp.vel.z = frandom[fp](2, 4);
			fp.accel.xy = -(fp.vel.xy * 0.035); //acceleration is aimed to the opposite of velocity
			fp.accel.z = -(fp.vel.z / fp.lifetime);

			fp.size = random[fp](4, 10);
			fp.sizeStep = -(fp.size / fp.lifetime); //size reduces to 0 over lifetime
			fp.startalpha = frandom[fp](0.75, 1.0);
			fp.fadestep = -1;
			fp.startRoll = frandom[fp](0, 360);
			fp.rollvel = frandom[fp](-15, 15);
			fp.rollacc = -(fp.rollvel / fp.lifetime); //rollvel reduces to 0 over lifetime

			Level.SpawnParticle(fp);
		}
	}
}