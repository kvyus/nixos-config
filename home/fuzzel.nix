{ pkgs, ... }:
{
   programs.fuzzel = {
      enable = true;
      settings = {
#         colors = {
#            background = "282828ff";
#            text = "fbf1c7ff";
#            prompt = "fbf1c7ff";
#            selection-text = "282828ff";
#            selection = "fb4934ff";
#            border = "ebdbb2ff";
#            input = "fbf1c7ff";
#         };
         border = {
            radius = 6;
            width = 3;
         };
      };
   };
}
