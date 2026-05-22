{ pkgs, lib, nvf, ... }:
{
   programs.nvf = {
      enable = true;
      settings = {
         vim = {            
            keymaps = [
               { mode = "n"; key = "n"; action = "j";  } 
               { mode = "v"; key = "n"; action = "j";  }
               { mode = "o"; key = "n"; action = "j";  }

               { mode = "n"; key = "e"; action = "k";  }  
               { mode = "v"; key = "e"; action = "k";  }
               { mode = "o"; key = "e"; action = "k";  }

               { mode = "n"; key = "i"; action = "l";  }
               { mode = "v"; key = "i"; action = "l";  }
               { mode = "o"; key = "i"; action = "l";  }

               { mode = "n"; key = "m"; action = "h";  }
               { mode = "v"; key = "m"; action = "h";  }
               { mode = "o"; key = "m"; action = "h";  }

               { mode = "n"; key = "j"; action = "y";  } 
               { mode = "v"; key = "j"; action = "y";  } 
               { mode = "o"; key = "j"; action = "y";  }
                
               { mode = "n"; key = "t"; action = "f";  }
               { mode = "v"; key = "t"; action = "f";  }
               { mode = "o"; key = "t"; action = "f";  }

               { mode = "n"; key = "l"; action = "u";  }
               { mode = "v"; key = "l"; action = "u";  }
               { mode = "o"; key = "l"; action = "u";  }

               { mode = "n"; key = "u"; action = "i";  }
               { mode = "v"; key = "u"; action = "i";  }
               { mode = "o"; key = "u"; action = "i";  }

               { mode = "n"; key = "y"; action = "o";  }
               { mode = "n"; key = "Y"; action = "O";  }
            ];
            opts.clipboard = "unnamedplus";
            opts.shiftwidth = 3;

            theme = {
               enable = true;
               style = "dark";
            };

            languages = {
               clang.enable = true;
               zig.enable = true;
               python.enable = true;
               markdown.enable = true;
               typescript.enable = true;
               nix.enable = true;
               lua.enable = true;
               css.enable = true;
               rust.enable = true;
               html.enable = true;
            };

            lsp = {
               enable = true;
            };

            statusline.lualine = {
               enable = true;
               #theme = "gruvbox_dark";
               activeSection = {
                  a = [
                     '' { "mode", icons_enabled = true } ''
                  ];
                  b = [

                  ];
                  c = [

                  ];
                  y = [

                  ];
                  z = [
                     '' { "filetype", colored = false, icon_only = false } '' 
                  ];
               };
               inactiveSection = {
                  a = [
                     '' { "mode", icons_enabled = true } ''
                  ];
                  b = [

                  ];
                  c = [

                  ];
                  y = [

                  ];
                  z = [
                     '' { "filetype", colored = false, icon_only = false } '' 
                  ];
               };
            };
            telescope.enable = true;
            dashboard.startify.enable = true;
            git.enable = true;
            autocomplete.nvim-cmp.enable = true;
            autopairs.nvim-autopairs.enable = true;
            visuals.nvim-web-devicons.enable = true;
         };
      };
   };
}
