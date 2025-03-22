class Knife : KurojiWeapon{
    Default{
        Weapon.BobStyle "Smooth";

        Weapon.AmmoType "Shell";
        Weapon.SlotNumber 1;
        Weapon.SlotPriority 5;
        Tag "Tactical \c[s8]DQ-50B knife\c-";

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
            KNIF BCDFGIKLMO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing2");
            GoTo SwingDone;
        Swing2:
            TNT1 A 0 A_OverlayRotate(1, frandom(-10,10));
            KNF2 BCDFGILMO 1;
            TNT1 A 2;
            TNT1 A 2 A_ReFire("Swing");
        SwingDone:
            TNT1 A 0 A_OverlayRotate(1, 0);
            KNI2 EDBA 1;
            GoTo Ready;
    }
}