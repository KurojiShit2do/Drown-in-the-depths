class ElectricRifle : KurojiWeapon{
    Default{
        KurojiWeapon.MagazineSize 8;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 6;
        Weapon.SlotPriority 5;
        Weapon.AmmoType "Shell";
        Weapon.AmmoUse 1;
        Weapon.AmmoGive 8;
        Inventory.PickupMessage "You got the \cfAuto Raper\c-!";
        Tag "\c[k1]OarFish\c- Prime Rifle";

        +Weapon.AMMO_OPTIONAL
    }
    States{
        Spawn:
            TNT1 A -1;
            Stop;
        
        Ready:
            PLSM  A 1 A_WeaponReady(WRF_ALLOWRELOAD);
            Loop;
        Select:
            PLSM  A 1 A_Raise(12);
            Wait;
        Deselect:
            TNT1 A 0 A_StartSound("Weapons/DeSelect", 1, 0, 5.0);
            PLSM  A 1 A_Lower(12);
            Wait;

        Fire:
            TNT1 A 0 {
                A_AlertMonsters();
                A_StartSound("Plasma/Fire",1);
                A_FireProjectile("ElectricBall", frandom(-2,2), 0, 0, 0, FPF_AIMATANGLE , frandom(-2,2));
                //A_FireBullets(4,3,1,12,"KurojiBulletPuffPurple",FBF_NORANDOM,8192);
            }
            PLSM BC 1 BRIGHT A_RandomWeaponOffset(frandom(-2,2),frandom(-2,2));
            PLSM D 2 A_WeaponOffsetReset;
            PLSM E 1 A_ReFire("Fire");
            PLSM FGH 1;
            TNT1 A 0;
            GoTo Ready;
    }
}

Class ElectricBall : Actor{
    
    static const string ParticleColors[] = {
        "00f9ff",
        "00dbff",
        "00c1ff",
        "00abff",
        "0091ff",
        "0073ff",
        "0037ff"
    };
    
    Default{
        Radius 13;
		Height 8;
		Speed 125;
 		Damage 5;
		Projectile;
		+RANDOMIZE
		+ZDOOMTRANS
        +NOGRAVITY
		RenderStyle "Add";
		Alpha 1;
    }
    States{
        Spawn:
            
            GRRP ABABABABABAB 1 BRIGHT {
                                A_SpawnParticle(ParticleColors[2],                 //Color
                                SPF_FULLBRIGHT,                         //Flags
                                5,                                      //Lifetime
                                15,                                   //Size
                                0,                                      //Angle
                                0,0,0,                                  //XYZ offset
                                frandom(-1,1),frandom(-1,1),frandom(-1,1),        //XYZ vel
                                0, 0, 0);

                                A_SpawnParticle(ParticleColors[random(0,6)],                 //Color
                                SPF_FULLBRIGHT,                         //Flags
                                random(2,5),                           //Lifetime
                                frandom(5,8),                           //Size
                                0,                                      //Angle
                                0,0,0,                                  //XYZ offset
                                frandom(-4,4), frandom(-4,4), frandom(-2,2),        //XYZ vel
                                0, 0, 0);
            }
            TNT1 A 0 A_SetRoll(random(0, 359));
            Loop;
        Death:
            TNT1 A 0 {
                for(int i = 0; i < 15; i++){
                    A_SpawnParticle(ParticleColors[random(0,6)],                 //Color
                                    SPF_FULLBRIGHT,                         //Flags
                                    random(2,7),                           //Lifetime
                                    frandom(5,8),                           //Size
                                    0,                                      //Angle
                                    0,0,0,                                  //XYZ offset
                                    frandom(-4,4), frandom(-4,4), frandom(-10,10),        //XYZ vel
                                    frandom(-2,2), frandom(-2,2), frandom(-2,2));
                }
            }
            GRRP FGHIJ 2 BRIGHT;
            Stop;
    }
}