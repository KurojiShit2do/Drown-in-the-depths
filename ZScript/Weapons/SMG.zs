class SMG : KurojiWeapon {
    Default{
        KurojiWeapon.MagazineSize 30;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 4;
        Weapon.SlotPriority 5;
        Weapon.AmmoType "Clip";
        Weapon.AmmoUse 1;
        Weapon.AmmoGive 30;
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
            SMGA  A 1 A_WeaponReady(WRF_ALLOWRELOAD);
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
                    SetWeaponState("Reload");
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
                    SetWeaponState("Reload");
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
        Reload:
            TNT1 A 0{
                A_StopSound(1);
                if(!invoker.owner.CountInv("Clip")){SetWeaponState("Ready"); return;}

                if (invoker.WeaponMagCount == invoker.WeaponMagMax)
                SetWeaponState("Ready");
                return;
            }
            SMGA A 1 A_StartSound("Weapons/DeSelect",1);
            SMGR ABCDEF 1 A_RandomWeaponOffset(frandom(-1,1),frandom(-1,1));
            SMGR G 10 {KurojiReload(); A_WeaponOffsetReset;}
            SMGR FEDCBA 1;
            SMGA A 2;
            GoTo Ready;
    }
}