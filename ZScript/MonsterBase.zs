class KurojiMonsters : Actor{

    int EnergyCapacity;
    bool SysBust;

    string GibType;
    property GibbingType: GibType;

    Default{
        Monster;
        +FLOORCLIP;
    }

    void A_Kurogib() {
        A_SpawnItemEx("GibGenerator",0,0,0,vel.x,vel.y,vel.z,0,SXF_USEBLOODCOLOR|SXF_ABSOLUTEVELOCITY);
    }

    void A_SmallKurogib() {
        A_SpawnItemEx("SmallGibGenerator",0,0,0,vel.x,vel.y,vel.z,0,SXF_USEBLOODCOLOR|SXF_ABSOLUTEVELOCITY);
    }

    void A_GibKurogib() {
        A_SpawnItemEx("BossGibGenerator",0,0,0,vel.x,vel.y,vel.z,0,SXF_USEBLOODCOLOR|SXF_ABSOLUTEVELOCITY);
    }
}