class TempRifle : KurojiWeapon{
    Default{
        KurojiWeapon.MagazineSize 15;
        KurojiWeapon.MagazineCount 15;

        KurojiWeapon.TemparyWeapon true;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 4;
        Weapon.AmmoGive 1;
        Weapon.SlotPriority 2;
        Weapon.AmmoType "HACKAMMOBECAUSEIMRETARD";
        Inventory.PickupMessage "You got the \c[r8]Semi Cummy Rifle\c-!";
        Tag "Semi Battle Rifle";

        +Weapon.AMMO_OPTIONAL
        +Weapon.noautofire
    }
    States{
        Spawn:
        SHOT A -1;
        Stop;
    
        NoAmmo:
            RF11 A 10 A_StopSound(1);
            GoTo Ready;
        Ready:
            RF11  A 1 A_WeaponReady();
            Loop;
        Select:
            TNT1 A 0 A_StartSound("Weapons/Select",1);
            RF11  A 1 A_Raise(12);
            Wait;
        Deselect:
            TNT1 A 0 A_StartSound("Weapons/DeSelect",1);
            RF11  A 1 A_Lower(12);
            Wait;

        Fire:
            TNT1 A 0 {
                if(invoker.WeaponMagCount == 0){
                    SetWeaponState("Drop");
                    return;
                }
                Weapon_TakeAmmo();
                A_AlertMonsters();
                A_StartSound("TemperaryWeapons/RifleFire",1);
                A_FireBullets(1,1,1,55,"KurojiBulletPuffPurple",FBF_NORANDOM,8192);
            }
            RF11 BC 1 BRIGHT A_RandomWeaponOffset(frandom(-3,3),frandom(-3,3));
            RF11 D 1 A_WeaponOffsetReset;
            RF11 EFG 1;
            RF11 A 3;
            GoTo Ready;

        Drop:
            TNT1 A 0 A_StopSound(1);
            TNT1 A 0 A_StartSound("TemperaryWeapons/Break");
            TNT1 A 1 A_TakeInventory("TempRifle");
            GoTo Deselect;
    }
}