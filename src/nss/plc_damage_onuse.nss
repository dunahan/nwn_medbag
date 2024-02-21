void main()
{
  object oPC = GetLastUsedBy();
  effect eDamage = EffectDamage(1);

  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
}
