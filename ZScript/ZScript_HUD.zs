class myStatusBar : BaseStatusBar
{
	int shownHp;

	string HPMonitor;
	string HPBack;
	string HPIcon;

	int AmmoX;
	int AmmoY;

	override void Init(){
		super.Init();
		SetSize(0,320,200);
		shownHp = 0;
		
	}
	
	override void Tick(){
		int health = CPlayer.mo.health;
		
		Super.Tick();

	}
	
	override void Draw(int state, double TicFrac){
		Super.Draw (state, TicFrac);
		fullscreenOffsets = true;	
		HUDFont bigFont = HUDFont.Create("BIGFONT2");

		AmmoX = 0;
		AmmoY = 0;

		let KuroPlayer = DrownedPlayer(cplayer.mo);
		
		int health = CPlayer.mo.health;
		int my_armor = GetArmorAmount();
		int my_air = KuroPlayer.KAir;
		inventory ammo = GetCurrentAmmo();

		
		let curWeap = KurojiWeapon(cplayer.ReadyWeapon);

		DrawString(bigFont, FormatNumber(health),(40,-24));
		DrawString(bigFont, FormatNumber(my_armor),(40,-44));
		DrawString(bigFont, FormatNumber(my_air),(40,-64));
		
		if (curWeap != null){

			if(curWeap.GetClassName() != "Knife"){
			DrawString(bigFont, FormatNumber(ammo.amount),(-42,-24), DI_TEXT_ALIGN_RIGHT );

			DrawImage("HP_YLOFF",(-46,-10),DI_MIRROR);
			DrawImage("HUD_HYBG", (-24, -12));
			DrawImage("HUD_m2", (-24, -12));
	
			DrawImage("HP_YLOFF",(-46,-30),DI_MIRROR);
			DrawImage("HUD_HYBG", (-24, -32));
			DrawImage("HUD_AM", (-24, -32));
			}
			
			switch(curWeap.GetClassName())	{
				case 'SPAS12':
					for(int i = 0; i < curWeap.WeaponMagMax; i++){
						DrawImage("HUD_SHL", (-78+AmmoX, -35),0,1,(-1,-1),(0.75,1));
						if(i >= curWeap.WeaponMagCount){DrawImage("HUD_NSH", (-78+AmmoX, -35),0,1,(-1,-1),(0.75,1));}
						AmmoX += 5;
					}
					break;
				case 'SMG':
					for(int i = 0; i < curWeap.WeaponMagMax; i++){
						DrawImage("HUD_BLL", (-100+AmmoX, -35),0,1,(-1,-1),(0.75,1));
						if(i >= curWeap.WeaponMagCount){DrawImage("HUD_NBL", (-100+AmmoX, -35),0,1,(-1,-1),(1,1));}
						AmmoX += 2;
					}
					break;
			}
		}

		if(my_armor > 0){
			DrawImage("HUD_ARON", (46, -30));
		}else{
			DrawImage("HUD_AROF", (46, -30));
		}
		
		DrawImage("HUD_ARBG", (24, -32));
		DrawImage("HUD_AR", (24, -32));
		
		HPMonitor = "HP_GLON";
		HPIcon = "H_HPG";
		HPBack = "HUD_HPBG";
		if(health < 1){
			HPMonitor = "HP_RLOFF";
			HPIcon = "H_HPR";
			HPBack = "HUD_HPBR";
		} else if(health <= 25){
			HPMonitor = "HP_RLON";
			HPIcon = "H_HPR";
			HPBack = "HUD_HPBR";
		} else if(health <= 50){
			HPMonitor = "HP_YLON";
			HPIcon = "H_HPY";
			HPBack = "HUD_HPBY";
		}

		DrawImage(HPMonitor, (46, -10));
		DrawImage(HPBack, (24, -12));
		DrawImage(HPIcon, (24, -12));
		
		DrawImage("HUD_OXY", (46,-50));
    }

}