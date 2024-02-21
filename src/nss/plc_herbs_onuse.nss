void main()
{
  object oPC = GetLastUsedBy();
  int nSkillHeal = GetSkillRank(SKILL_HEAL, oPC, TRUE) * 10;                    // get skill heal and multiply by 10
  int nMaxHerbs = 99 + nSkillHeal;                                              // can collect more herbs if skill heal is higher then 0
  int nHerbs = GetLocalInt(oPC, "Herbs"), nHpPlant, nNewHerbs;

  if (nHerbs == 0)                                                              // herbs = null
  {
    nHpPlant = GetCurrentHitPoints();
    nNewHerbs = nHpPlant;
  }
  else if (nHerbs >= 1 && nHerbs <= nMaxHerbs)                                  // herbs >= one AND <= 99 + skill_heal * 10
  {
    nHpPlant = GetCurrentHitPoints();
    nNewHerbs = nHerbs + nHpPlant;

    if (nNewHerbs > nMaxHerbs)                                                  // don't add if over max herbs!
      nNewHerbs = nMaxHerbs + 1;
  }

  else
    FloatingTextStringOnCreature("Herbs full", oPC, FALSE);                     // show it's full

  if (nNewHerbs > 0)
    SetLocalInt(oPC, "Herbs", nNewHerbs);                                       // set new herbs

  FloatingTextStringOnCreature("Herbs now: " + IntToString(GetLocalInt(oPC, "Herbs")) +
                               " / " + IntToString(nMaxHerbs + 1),
                               oPC,
                               FALSE);                                          // show how much!
}
