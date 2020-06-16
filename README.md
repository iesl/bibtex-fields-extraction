# bibtex-fields-extraction

## Install requirments
```
pip install requirements.txt
```
## Install texlive without roof priviliage
```
install install-tl-unx:
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xvzf install-tl-unx.tar.gz
```
### Create texlive.profile
```
selected_scheme scheme-medium
TEXDIR /home/Bob/texlive
TEXMFCONFIG $TEXMFSYSCONFIG
TEXMFHOME $TEXMFLOCAL
TEXMFLOCAL /home/Bob/texlive/texmf-local
TEXMFSYSCONFIG /home/Bob/texlive/texmf-config
TEXMFSYSVAR /home/Bob/texlive/texmf-var
TEXMFVAR $TEXMFSYSVAR
collection-basic 1
collection-latex 1
in_place 0
option_adjustrepo 1
option_autobackup 1
option_backupdir tlpkg/backups
option_desktop_integration 0
option_doc 0
option_file_assocs 0
option_fmt 0
option_letter 0
option_menu_integration 1
option_path 0
option_post_code 1
option_src 0
portable 1
```
### Install texlive
```
./install-tl --profile=texlive.profile 
```
## Generate labeled citation strings in CONLL format
```
python prepro_bibtex.py <your_bibfile_path> <style>
```