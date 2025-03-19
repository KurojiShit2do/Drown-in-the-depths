class SPAS12 : KurojiWeapon{

    Default{
        KurojiWeapon.MagazineSize 8;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 3;
        Weapon.SlotPriority 5;
        Weapon.AmmoType "Shell";
        Weapon.AmmoUse 0;
        Weapon.AmmoGive 8;
        Inventory.PickupMessage "You got the \cfAuto Raper\c-!";
        Tag "SPAS12";

        +WEAPON.NOAUTOFIRE;
    }
    
    States{
        Spawn:
            SHOT A -1;
            Stop;

        Ready:
            SPSS  A 1 A_WeaponReady();
            Loop;
        Select:
            SPSS  A 1 A_Raise(12);
            Wait;
        Deselect:
            SPSS  A 1 A_Lower(12);
            Wait;
        
        Fire:
            TNT1 A 0 {
                A_AlertMonsters();
                A_StartSound("SPAS12/Fire",1);
                A_FireBullets(4,3,6,12,"KurojiBulletPuff",FBF_USEAMMO|FBF_NORANDOM,8192);
                A_SetOffsetVariables(frandom(-1.5,1.5),frandom(-1,0));
            }
            SPSS BC 1 BRIGHT A_RandomWeaponOffset;
            SPSS DEFG 1 ;
            SPSS HIJ 1;
            SPSS A 5 A_WeaponOffsetReset;
            GoTo Ready;

        AltFire:
            TNT1 A 0 {
                A_AlertMonsters();
                A_StartSound("SPAS12/Fire",1);
                A_FireBullets(4,3,8,12,"KurojiBulletPuff",FBF_USEAMMO|FBF_NORANDOM,8192);
                A_SetOffsetVariables(frandom(-2,2),frandom(-1,0));
            }
            SPSS BC 1 BRIGHT A_RandomWeaponOffset;
            SPSS DEFGHIJ 1;
            SPSP ABCDEFGH 1 A_WeaponOffsetReset;
            SPSP IJ 2;
            TNT1 A 0 A_StartSound("SPAS12/Pump",1);
            SPSP KL 2;
            SPSP LKJI 2;
            SPSP HGFEDCBA 1;
            GoTo Ready;

        Flash:
            TNT1 A 4 A_Light1;
            TNT1 A 3 A_Light2;
            TNT1 A 0 A_Light0;
            Stop;
    }
}