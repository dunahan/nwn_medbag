//::///////////////////////////////////////////////
//:: Player Tool 1 Instant Feat
//:: x3_pl_tool01
//:: Copyright (c) 2007 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is a blank feat script for use with the
    10 Player instant feats provided in NWN v1.69.

    Look up feats.2da, spells.2da and iprp_feats.2da

*/
//:://////////////////////////////////////////////
//:: Created By: Brian Chung
//:: Created On: 2007-12-05
//:://////////////////////////////////////////////

void main()
{
  int nFactor = 10;                                                             // global factor
  object oUser = OBJECT_SELF;                                                   // user itself
  int nMaxHerbs = 99 + GetSkillRank(SKILL_HEAL, oUser, TRUE) * nFactor;         // get the skill of the user and max hearbs
  int nCollectedHerbs = GetLocalInt(oUser, "Herbs");                            // how many herbs exist

  object oTarget = GetSpellTargetObject();                                      // if he target someone else
  if (oTarget == oUser)
    oTarget = oUser;

  int nMaxHP, nActHP, nPossibleHealingPoints, nHeal;
  effect eLink, eHeal,  eVis = EffectVisualEffect(VFX_IMP_HEALING_S);

  nActHP = GetCurrentHitPoints(oTarget);
  nMaxHP = GetMaxHitPoints(oTarget);

  if (nActHP < nMaxHP)                                                          // only if healing needed
  {
    nPossibleHealingPoints = nCollectedHerbs/nFactor;                           SendMessageToPC(oUser, "> "+IntToString(nPossibleHealingPoints));

    if (nPossibleHealingPoints > 0)
    {
      if (nMaxHP-nActHP > nPossibleHealingPoints)
        nHeal = nPossibleHealingPoints;                                         // heal only the max herbs

      else
        nHeal = nMaxHP-nActHP;                                                  // or if damage is smaller to this

      eHeal = EffectHeal(nHeal);
      eLink = EffectLinkEffects(eVis, eHeal);

      ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);
    }

    SetLocalInt(oUser, "Herbs", GetLocalInt(oUser, "Herbs")-(nHeal*nFactor));
  }

  FloatingTextStringOnCreature("Herbs now: " + IntToString(GetLocalInt(oUser, "Herbs")) +
                               " / " + IntToString(nMaxHerbs + 1),
                               oUser,
                               FALSE);                                          // show how much!
}
