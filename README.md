cd ~/.config  
git clone git@github.com:mikoto2726/nvim.git  
cd nvim  
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
sudo apt update
sudo apt install -y build-essential
nvim  
:PackerSync
