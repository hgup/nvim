# My nvim config

**It's FAST! (no kidding)**

Quickly setup my exact neovim config without any compromises in a few easy steps.

![screenshot](screenshot.png)

## Installation guide (for the ultimate noob)

### If you are on Windows:
- Download neovim from [github](https://github.com/neovim/neovim/releases/tag/v0.5.0), or use a package manager like [choco](https://chocolatey.org/)
- if you already have an `init.vim` config, backup it before proceeding.
- run the following command from cmd or powershell or bash or any other prompt you like. :sweat_smile:
```git
git clone https://github.com/hgup/nvim ~/appdata/local/nvim
```
- run nvim, and spam `enter` to get rid of all the errors.
- [VimPlug](https://github.com/junegunn/vim-plug) will automatically install all the required plugins.
- After having done that, just restart nvim and Kudos. :tada:

---
### If you are on Linux:
> you know what to do ;)
- just run this
```git
git clone https://github.com/hgup/nvim ~/.config/nvim
```
- run nvim, and spam `enter` to get rid of all the errors.
- [VimPlug](https://github.com/junegunn/vim-plug) will automatically install all the required plugins.
- and you are done. Restart to view effects.

---

### About

It looks a lot like [chris@machine’s](https://github.com/ChristianChiarulli)  [LunarVim](https://github.com/lunarvim/lunarvim) as a lot of elements have been **inspired :eyes: (don’t sue me)** from it.

Reconfiguring it is quite simple, just take a look at [`init.vim`](https://github.com/hgup/nvim/blob/main/init.vim) and it all will make sense.

#### Config - has the following organization

- PLUGINS (using [VimPlug](https://github.com/junegunn/vim-plug))
- KEYBINDINGS (feel free to change them as you like)
- STANDARD SETTINGS (the necessary settings that all vimmers change)
- RICING (to add that extra bling)
- GUI SETTINGS (I use [neovide](https://github.com/neovide/neovide) as neovim’s GUI client. Check it out)
- PLUGIN SETTINGS (to configure the plugins individually)
  - [–LOOKS–] # not required though, same as ricing but if (at all) any colorscheme related settings
  - [–FUNCTIONAL–] # useful plugin settings
  - [–HYBRID–] # adds to looks as well as useful at the same time
  - [–NAVIGATION–] # things that allow you to move **faster!!!!!!!!**

> Yeah, I know that its a really long init file. But my philosophy is having only one place where you can copy and paste the config from :skull: instead of having a directory structure that is a **pain to maintain.** 

