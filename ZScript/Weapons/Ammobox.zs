class SpecialAmmoBox : Inventory{

    Default{
        Inventory.PickupMessage "Picked up ammo box!";
        Inventory.MaxAmount 1000000; //uh oh hack
    }
    States{
        Spawn:
            AMMO A -1;
            Stop;
    }

    override void DoPickupSpecial(actor toucher){
        
        if (!toucher || !toucher.player)
        return;

        let pwep = KurojiWeapon (toucher.player.ReadyWeapon);
        
        int MaxAmmo = pwep.WeaponMagMax;
        int CurAmmo = pwep.WeaponMagCount;

        double ModAmmogive = MaxAmmo * 0.25;
        if(pwep.TempWep == true){pwep.WeaponMagCount = CurAmmo + ModAmmogive;}
    }
}