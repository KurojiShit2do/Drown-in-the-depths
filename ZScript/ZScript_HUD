class myStatusBar : BaseStatusBar
{
	int shownHp;
	string HPPrecent;

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
		HUDFont bigFont = HUDFont.Create("SMALLFNT");
		
		int health = CPlayer.mo.health;
		int my_armor = GetArmorAmount();
		inventory ammo = GetCurrentAmmo();

		string weaponName = "";
		let curWeap = CPlayer.readyweapon;

		if(curWeap) {
			weaponName = curWeap.getClassName(); 
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
			HPPrecent = "HP_YLOM";
		}

		DrawImage(HPPrecent, (46, -10));
		DrawImage("HUD_HPBG", (24, -12));
		DrawImage("HUD_HP", (24, -12));
		
		DrawImage("HUD_OXY", (46,-50));

		DrawImage("HP_YLOFF",(-46,-10),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -12));

		DrawImage("HP_YLOFF",(-46,-30),DI_MIRROR);
		DrawImage("HUD_HYBG", (-24, -32));

		DrawString(bigFont, FormatNumber(health),(40,-22));
		DrawString(bigFont, FormatNumber(my_armor),(40,-42));
		DrawString(bigFont, FormatNumber(ammo.amount),(-60,-22));
    }

	void DrawAmmo(string CurrentWeapon){
		
	}

}