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