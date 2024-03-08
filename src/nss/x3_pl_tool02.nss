//::///////////////////////////////////////////////
//:: Player Tool 2 Instant Feat
//:: x3_pl_tool02
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
  object oPC, oTarget, oPickUp; location locTarget;
  float fPickUpRange = 5.0;
  oPC = OBJECT_SELF;                                                            // user itself

  if (GetIsObjectValid(GetAreaFromLocation(GetSpellTargetLocation())))          // its a location
    locTarget = GetSpellTargetLocation();

  else if (GetSpellTargetObject() == oPC)                                       // its the pc
    locTarget = GetLocation(oPC);

  AssignCommand(oPC, ClearAllActions(TRUE));
  oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fPickUpRange, locTarget, TRUE, OBJECT_TYPE_ITEM);
  while (GetIsObjectValid(oTarget))
  {
    AssignCommand(oPC, ActionPickUpItem(oTarget));
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, fPickUpRange, locTarget, TRUE, OBJECT_TYPE_ITEM);
  }
}
