# Proton Manager

## Description
Proton Manger is a Home Manger module to manage Proton Versions for various Tools.
Currently only Proton-GE is implemented and has support for Heroic,Lutris and SteamTinkerLaunch.
This Project was initiated after i found it annoying to download the same Version of Proton-GE to 3 different Devices and realising that they ran on different Versions before

## Known Issues
If you use SteamTinkerLaunch the Proton Version will not be recognized due to a design flaw which does not follow Symlinks. [A PR is open](https://github.com/sonic2kk/steamtinkerlaunch/pull/1287)
If you want to adjust it right now then you need to edit the file ´~/.config/steamtinkerlaunch/protonlist.txt´ and add ´{HOME}/.config/steamtinkerlaunch/proton/custom/Proton-Manager-GE-Proton10-29/proton´ to it (replace {HOME} with your Home Directory and also adjust to the Proton Version you want to have)

## Ideas for Future Development
- Add different Flavors of Proton
- Add Wine and Wine Flavors
- Add support for Custom linking
- Automate grabbing of new Versions
- Improve Documentation of options