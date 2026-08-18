Just my own shell config.

**Setup:**

```bash
mkdir -p ~/src; cd ~/src; git clone https://github.com/fotinakis/bashrc.git; for f in ~/.bashrc ~/.zshrc; do echo -e "\nsource ~/src/bashrc/init.sh\n" >> $f; done
```