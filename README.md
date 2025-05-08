# 😺 My Impurrfect NixOS Setup

Here is my modular nixos setup, that I daily drive. You can use by following the instructions below, or just read it to get some ideas. If you find something wrong please open an issue and help out if you want :)

## 💼 Software Suite
- [Zen Browser](https://zen-browser.app/): For browsing internet
- [Ghostty](https://ghostty.org/): Terminal
- [Neovim](https://neovim.io/): Text/Code editor
- [Waydroid](https://waydro.id/): For Android related development
- [Vesktop](https://github.com/Vencord/Vesktop): Discord Client
- [Zsh](https://www.zsh.org/): Shell Environment
- [Gnome](https://www.gnome.org/): Desktop Environment

The complete list of packages is in [`systemModule/packages.nix`](https://github.com/anthonyprime202/dots/blob/main/systemModules/packages.nix). 

## ⚙️ Installation
**Step 1:** Install NixOS from [nixos.org](https://nixos.org). Follow the instruction and create a base install. While installing enable the flake feature in `nix.settings.experiment-features` option.
```nix
nix.settings.experimental-features = [ "nix-commands" "flakes" ];
```

**Step 2:** Run this command to ensure `git` is installed
```sh
nix-shell -p git vim
```

**Step 3:** Run the following commands to install the repo
```sh
cd && git clone https://github.com/anthonyprime202/dots
cd dots
```

**Step 4:** If you want you can checkout some options and create new host inside `hosts` directory. If you just want to go with default, do:
```sh
nixos-generate-config --show-hardware-config > hosts/thinkbook/hardware-configuration.nix
```

**Step 5:** Update the contents of `config.nix` according to you.

```nix
{
  wm = "gnome"; # "plasma" "gnome"
  username = "Username";
  fullname = "Full Name";
  email = "email";
  gitUser = "Github Username";
  terminal = "Terminal of choice"; # Needs to be installed separately
}
```

**Step 6:** At last you can rebuild your system to you the config
```sh
nixos-rebuild switch --flake ~/dots
```

**⚠️ Note**: *HyprLand* setup is still work in progress

If you have any issues while installing you can open an issue or ask me directly if you can >_<.

## 💻 Screenshots
![[Screenshot 1]](screenshots/1.png)
![[Screenshot 2]](screenshots/2.png)
![[Screenshot 3]](screenshots/3.png)
![[Screenshot 4]](screenshots/4.png)

## 💬 Feedback
If you have any questions, suggestions, or comments, feel free to reach out via issues or on Instagram (@its.panda202).

**I Hope You Enjoy The Rice :)**

