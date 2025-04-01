class Knife : KurojiWeapon{
    Default{
        Weapon.BobStyle "Smooth";

        Weapon.AmmoType "Shell";
        Weapon.SlotNumber 1;
        Weapon.SlotPriority 5;
        Tag "Tactical \c[s8]DQ-50B knife\c-";

        +Weapon.noautofire
        +Weapon.AMMO_OPTIONAL
        +WEAPON.NOALERT;
    }

    States{
        Spawn:
            TNT1 A -1;
            Loop;
        Ready:
            KNIF  A 1 A_WeaponReady(WRF_ALLOWRELOAD);
            Loop;
        Select:
            KNIF A 1 A_Raise(12);
            Wait;
        Deselect:
            TNT1 A 0 A_StartSound("Weapons/DeSelect", 1, 0, 5.0);
            KNIF A 1 A_Lower(12);
            Wait;
        Fire:
            KNI2 ABDE 1;
        Swing:
            TNT1 A 0 A_OverlayRotate(1, frandom(-6,6));
            KNIF BCDFGI 1;
            TNT1 A 0 A_CustomPunch(10,1,CPF_NOTURN,"KurojiKnifePuff");
            KNIF KLMO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing2");
            GoTo SwingDone;
        Swing2:
            TNT1 A 0 A_OverlayRotate(1, frandom(-10,10));
            KNF2 BCDFG 1;
            TNT1 A 0 A_CustomPunch(10,1,CPF_NOTURN,"KurojiKnifePuff");
            KNF2 ILMO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing");
        SwingDone:
            TNT1 A 0 A_OverlayRotate(1, 0);
            KNI2 EDBA 1;
            GoTo Ready;
    }
}

class KurojiKnifePuff : BulletPuff {
    static const string PuffColor[] = {
        "FFFFFF",
        "B9B9B9",
        "939393",
        "818181",
        "5F5F5F",
        "474747",
        "373737",

        "ff0000",
        "ff4141",
        "ff7979",
        "ca0000",
        "dd0000"
    };
    Default {
		Alpha 1;
		VSpeed 0;
        Scale 0.25;
        SeeSound "KnifeHitThing";
        AttackSound "KnifeHitWall";
        ActiveSound "KnifeMiss";
	}
	States {
        Spawn:
            TNT1 A 4 Bright;
            TNT1 A 0 {
                A_SpawnParticle(PuffColor[7],SPF_FULLBRIGHT,25,frandom(8,13));
                for(int i = 0; i < 8; i++){
                    A_SpawnParticle(PuffColor[random(0,11)],                 //Color
                                    SPF_FULLBRIGHT,                         //Flags
                                    random(5,10),                           //Lifetime
                                    frandom(5,8),                           //Size
                                    0,                                      //Angle
                                    0,0,0,                                  //XYZ offset
                                    frandom(-4,4), frandom(-4,4), frandom(0,10),        //XYZ vel
                                    0, 0, -2);
                }
            }
            TNT1 A 4;
            Stop;
	}
}