class SPAS12 : KurojiWeapon{

    Default{
        KurojiWeapon.MagazineSize 8;
        Weapon.BobStyle "Smooth";
        Weapon.SlotNumber 3;
        Weapon.SlotPriority 5;
        Weapon.AmmoType "Shell";
        Weapon.AmmoUse 1;
        Weapon.AmmoGive 8;
        Inventory.PickupMessage "You got the \cfAuto Raper\c-!";
        Tag "SPAS12";

        +Weapon.noautofire
        +Weapon.AMMO_OPTIONAL
    }
    
    States{
        Spawn:
            SHOT A -1;
            Stop;

        NoAmmo:
            SPSS A 10;
            GoTo Ready;
        Ready:
            SPSS  A 1 A_WeaponReady(WRF_ALLOWRELOAD);
            Loop;
        Select:
            SPSS  A 1 A_Raise(12);
            Wait;
        Deselect:
            TNT1 A 0 A_StartSound("Weapons/DeSelect", 1, 0, 5.0);
            SPSS  A 1 A_Lower(12);
            Wait;
        
        Fire:
            TNT1 A 0 {
                if(invoker.WeaponMagCount == 0){
                    SetWeaponState("Reload");
			        return;
                }
                Weapon_TakeAmmo();
                A_AlertMonsters();
                A_StartSound("SPAS12/Fire",1);
                A_FireBullets(4,3,7,9,"KurojiBulletPuff",FBF_NORANDOM,8192);
                A_SetOffsetVariables(frandom(-1.5,1.5),frandom(-1,0));
            }
            SPSS BC 1 BRIGHT A_RandomWeaponOffset;
            SPSS DEFG 1 ;
            SPSS HIJ 1;
            GoTo Ready;

        AltFire:
            TNT1 A 0 {
                if(invoker.WeaponMagCount <= 0){
                    SetWeaponState("Reload");
			        return;
                }
                Weapon_TakeAmmo();
                A_AlertMonsters();
                A_StartSound("SPAS12/Fire",1);
                A_FireBullets(2,2,8,9,"KurojiBulletPuff",FBF_NORANDOM,8192);
                A_SetOffsetVariables(frandom(-1.5,1.5),frandom(-1,0));
            }
            SPSS BC 1 BRIGHT A_RandomWeaponOffset;
            SPSS DEFGHIJ 1;
            SPSP BDFGHE 1 A_WeaponOffsetReset;
            SPSP IJ 1;
            TNT1 A 0 A_StartSound("SPAS12/Pump",1);
            SPSP KL 1;
            SPSP LKJI 2;
            SPSP HGFEDB 1;
            GoTo Ready;
        Reload:
            TNT1 A 0{

                if(!invoker.owner.CountInv("Shell")){SetWeaponState("Ready"); return;}

                if (invoker.WeaponMagCount == invoker.WeaponMagMax)
                SetWeaponState("Ready");
                return;
            }
            SPSP ABCDEFGHI 1;
        ReloadLoop:
            TNT1 A 0 {if(!invoker.owner.CountInv("Shell")){SetWeaponState("ReloadDone"); return;}}
            SPSR ABCEGH 1;
            TNT1 A 0{
                A_StartSound("SPAS12/Load",1);
                invoker.WeaponMagCount += 1;
                invoker.owner.TakeInventory("Shell",1);
            }
            SPSR IJKL 1;
            TNT1 A 0 {
                if(invoker.WeaponMagCount == invoker.WeaponMagMax){
                    SetWeaponState("ReloadDone");
                }
            }
            Loop;
        ReloadDone:
            SPSP HGFEDCBA 1;
            GoTo Ready;
        Flash:
            TNT1 A 4 A_Light1;
            TNT1 A 3 A_Light2;
            TNT1 A 0 A_Light0;
            Stop;
    }
}