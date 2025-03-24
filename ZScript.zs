version "4.14.0"

#include "ZScript/ZScript_HUD.zs"

#include "ZSCript/WeaponBase.zs"
#include "ZScript/Weapons/SPAS12Shotgun.zs"
#include "ZScript/Weapons/Knife.zs"
#include "ZScript/Weapons/SMG.zs"
#include "ZScript/Weapons/Plasma.zs"

#include "sway/sway.txt"

class DrownedPlayer : PlayerPawn replaces DoomPlayer{

    int KAir;

    Default{
        Player.Displayname "DrownedPlayer";
    }

    override void PostBeginPlay() {
        KAir = 100;
        Super.PostBeginPlay();
    }

    override void Tick() {
		Super.Tick();

        switch(self.waterlevel){
            case 1:
            case 2:
            case 0:
                if(KAir < 100){ 
                    if(GetAge() % 5 == 0){KAir++; }
                }
                break;
            case 3:
                if(GetAge() % 35 == 0){ 
                    if(KAir > 0){ 
                        KAir = KAir - (1*random(1,4)); 
                    }
                }
                break;
        }

        if(KAir == 0 && GetAge() % 70 == 0){
            A_SetBlend("00 00 00", 1, 15);
            A_Pain();
            self.A_SetHealth(health - random(1,5));
        }

        if(self.waterdepth == 416 && GetAge() % 70 == 0){
            A_SetBlend("00 00 00", 1, 15);
            A_Pain();
            self.A_SetHealth(health - random(5,10));
            if(KAir > 0){ 
                KAir = KAir - 15; 
            }
        }

        if(KAir < 0){KAir = 0;}
	}
}