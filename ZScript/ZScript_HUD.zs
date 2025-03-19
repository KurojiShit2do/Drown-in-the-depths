class myStatusBar : BaseStatusBar
{
	int shownHp;
	string HPPrecent;
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
		
		int health = CPlayer.mo.health;
		int my_armor = GetArmorAmount();
		inventory ammo = GetCurrentAmmo();

		let curWeap = KurojiWeapon(cplayer.ReadyWeapon);

		DrawString(bigFont, FormatNumber(health),(40,-24));
		DrawString(bigFont, FormatNumber(my_armor),(40,-44));
		DrawString(bigFont, FormatNumber(ammo.amount),(-42,-24), DI_TEXT_ALIGN_RIGHT );
		
		if (curWeap != null){
			switch(curWeap.GetClassName())	{
				case 'SPAS12':
					for(int i = 0; i <8; i++){
						DrawImage("HUD_SHL", (-78+AmmoX, -35),0,1,(-1,-1),(0.75,1));
						if(i >= curWeap.WeaponMagCount){DrawImage("HUD_NSH", (-78+AmmoX, -35),0,1,(-1,-1),(0.75,1));}
						AmmoX += 5;
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
		
		HPPrecent = "HP_GLON";
		if(health < 1){
			HPPrecent = "HP_RLOFF";
		} else if(health <= 25){
			HPPrecent = "HP_RLON";
		} else if(health <= 50){
			HPPrecent = "HP_YLON";
		}

		DrawImage(HPPrecent, (46, -10));
		DrawImage("HUD_HPBG", (24, -12));
		DrawImage("HUD_HP", (24, -12));
		
		DrawImage("HUD_OXY", (46,-50));

		DrawImage("HP_YLOFF",(-46,-10),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -12));
		DrawImage("HUD_m2", (-24, -12));

		DrawImage("HP_YLOFF",(-46,-30),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -32));
		DrawImage("HUD_AM", (-24, -32));


    }

}