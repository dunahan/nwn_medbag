void main()
{
  string sMsg = GetPCChatMessage();
  object oPC = GetPCChatSpeaker();

  if (sMsg == "rld")
    StartNewModule(GetName(GetModule()));
}
