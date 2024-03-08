void main()
{
  object oPC = GetEnteringObject();

  effect ePcTool = EffectBonusFeat(FEAT_PLAYER_TOOL_01);
  ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePcTool, oPC);

         ePcTool = EffectBonusFeat(FEAT_PLAYER_TOOL_02);
  ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePcTool, oPC);

  ExecuteScript("x3_mod_def_enter", GetModule());
}
