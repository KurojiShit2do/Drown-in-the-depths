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

        if(health >= 0){

        if(KAir < 1){
                if(GetAge() % 5 == 0){A_StartSound("Oxygen/Beep",0);} 
            } else if(KAir <= 25){
                if(GetAge() % 15 == 0){A_StartSound("Oxygen/Beep",0);} 
            } else if(KAir <= 50){
                if(GetAge() % 25 == 0){A_StartSound("Oxygen/Beep",0);} 
            } else if(KAir <= 75){
                if(GetAge() % 55 == 0){A_StartSound("Oxygen/Beep",0);} 
            } else if(KAir <= 90){
                if(GetAge() % 75 == 0){A_StartSound("Oxygen/Beep",0);} 
            }

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
            DamageMobj(NULL, NULL, random(1,5), 'Drowning');
        }

        if(self.waterdepth == 416 && GetAge() % 70 == 0){
            A_SetBlend("00 00 00", 1, 25);
            A_Pain();
            DamageMobj(NULL, NULL, random(5,15), 'Drowning');
            if(KAir > 0){ 
                KAir = KAir - 15; 
            }
        }
        }
        if(KAir < 0){KAir = 0;}
    }
}