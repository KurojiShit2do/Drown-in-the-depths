class TempSMG : KurojiWeapon {
    Default{

        KurojiWeapon.MagazineSize 80;
        KurojiWeapon.MagazineCount 80;

        KurojiWeapon.TemparyWeapon true;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 4;
        Weapon.SlotPriority 4;
        Inventory.PickupMessage "You got the \c[r8]SMG\c-!";
        Tag "SMG";

        +Weapon.AMMO_OPTIONAL
    }

    States{
        Spawn:
            SHOT A -1;
            Stop;
        
        NoAmmo:
            SMGA A 10 A_StopSound(1);
            GoTo Ready;
        Ready:
            SMGA  A 1 A_WeaponReady();
            Loop;
        Select:
            TNT1 A 0 A_StartSound("Weapons/Select",1);
            SMGA  A 1 A_Raise(12);
            Wait;
        Deselect:
            TNT1 A 0 A_StartSound("Weapons/DeSelect",1);
            SMGA  A 1 A_Lower(12);
            Wait;

        Fire:
            TNT1 A 0 {
                if(invoker.WeaponMagCount == 0){
                    SetWeaponState("Drop");
                    return;
                }
                Weapon_TakeAmmo();
                A_AlertMonsters();
                A_StartSound("SMG/Fire",1);
                A_FireBullets(4,3,1,12,"KurojiBulletPuffPurple",FBF_NORANDOM,8192);
            }
            SMGA BC 1 BRIGHT A_RandomWeaponOffset(frandom(-3,3),frandom(-3,3));
            SMGA D 1 A_WeaponOffsetReset;
            SMGA E 1 A_ReFire("FireLoop");
            SMGA F 1;
            GoTo Ready;
        FireLoop:
            TNT1 A 0 {
                if(invoker.WeaponMagCount == 0){
                    SetWeaponState("Drop");
                    return;
                }
                Weapon_TakeAmmo();
                A_AlertMonsters();
                A_StartSound("SMG/FireLoop",1,CHANF_LOOPING );
                A_FireBullets(4,3,1,12,"KurojiBulletPuffPurple",FBF_NORANDOM,8192);
            }
            SMGA BC 1 BRIGHT A_RandomWeaponOffset(frandom(-3,3),frandom(-3,3));
            SMGA D 1 A_WeaponOffsetReset;
            SMGA E 1 A_ReFire("FireLoop");
            SMGA FA 1 A_StopSound(1);
            GoTo Ready;

        Drop:
            TNT1 A 0 A_StopSound(1);
            TNT1 A 0 A_StartSound("TemperaryWeapons/Break");
            TNT1 A 1 A_TakeInventory("TempSMG");
            GoTo Deselect;
    }
}