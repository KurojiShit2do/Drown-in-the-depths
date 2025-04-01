class myStatusBar : BaseStatusBar
{
	int shownHp;

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

		//DrawString(bigFont, FormatNumber(health),(40,-24));
		//DrawString(bigFont, FormatNumber(my_armor),(40,-44));
		DrawString(bigFont, FormatNumber(my_air),(40,-64));
		
		if (curWeap != null){

			if(curWeap.GetClassName() != "Knife" && curWeap.TempWep != true){
				DrawAmmo(ammo.amount, bigFont);
			}
			
			DrawMainWeaponInfo(curWeap.GetClassName(),curWeap.WeaponMagMax,curWeap.WeaponMagCount);
		}

		DrawHP(health, bigFont);
		DrawAR(my_armor, bigFont);
		
		DrawImage("HUD_OXY", (46,-50));
    }

	void DrawAmmo(int ammo, HUDFont font){

		DrawString(font, FormatNumber(ammo),(-42,-24), DI_TEXT_ALIGN_RIGHT );

		DrawImage("HP_YLOFF",(-46,-10),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -12));
		DrawImage("HUD_m2", (-24, -12));
		
		DrawImage("HP_YLOFF",(-46,-30),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -32));
		DrawImage("HUD_AM", (-24, -32));
	}

	void DrawMainWeaponInfo(name WepName, int WeaponMax, int WeaponCount){
		string I_MagFull;
		string I_MagEmpt;

		int AmmoX = 0;

		int OG_AmmoX;
		int MOD_AmmoX;

		switch(WepName){
			case 'SPAS12':
				I_MagFull = "HUD_SHL";
				I_MagEmpt = "HUD_NSH";
				OG_AmmoX = -78;
				MOD_AmmoX = 5;
				break;
			case 'SMG':
				I_MagFull = "HUD_BLL";
				I_MagEmpt = "HUD_NBL";
				OG_AmmoX = -100;
				MOD_AmmoX = 2;
				break;
		}

		for(int i = 0; i < WeaponMax; i++){
			DrawImage(I_MagFull, (OG_AmmoX+AmmoX, -35),0,1,(-1,-1),(1,1));
			if(i >= WeaponCount){DrawImage(I_MagEmpt, (OG_AmmoX+AmmoX, -35),0,1,(-1,-1),(1,1));}
			AmmoX += MOD_AmmoX;
		}
	}

	void DrawAR(int my_armor, HUDFont font){
		DrawString(Font, FormatNumber(my_armor),(40,-44));
		if(my_armor > 0){
			DrawImage("HUD_ARON", (46, -30));
		}else{
			DrawImage("HUD_AROF", (46, -30));
		}
		
		DrawImage("HUD_ARBG", (24, -32));
		DrawImage("HUD_AR", (24, -32));
	}

	void DrawHP(int health, HUDFont font){

		string HPMonitor;
		string HPBack;
		string HPIcon;

		DrawString(Font, FormatNumber(health),(40,-24));

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
	}

}