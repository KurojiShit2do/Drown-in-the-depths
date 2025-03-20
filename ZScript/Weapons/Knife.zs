class Knife : KurojiWeapon{
    Default{
        Weapon.BobStyle "Smooth";

        Weapon.AmmoType "Shell";
        Weapon.SlotNumber 1;
        Weapon.SlotPriority 5;
        Tag "Tactical \cDQ-50B knife\c-";

        +Weapon.noautofire
        +Weapon.AMMO_OPTIONAL
    }

    States{
        Spawn:
            TNT1 A -1;
            Loop;
        Ready:
            KNIF  A 1 A_WeaponReady(WRF_ALLOWRELOAD);
            Loop;
        Select:
            KNIF  A 1 A_Raise(12);
            Wait;
        Deselect:
            KNIF  A 1 A_Lower(12);
            Wait;
        Fire:
            KNI2 ABDE 1;
        Swing:
            KNIF BCDEFGIJKLMNO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing2");
            GoTo SwingDone;
        Swing2:
            KNF2 BCDEFGIJLMO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing");
        SwingDone:
            KNI2 EDBA 1;
            GoTo Ready;
    }
}