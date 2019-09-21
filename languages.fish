#!/usr/local/bin/fish

function setup_python
    if type pyenv > /dev/null 2>&1
        source (pyenv init - | psub)
        echo "source (pyenv init - | psub)" >> ~/.config/fish/config.fish
        pyenv install 2.7.8
        pyenv install 3.7.3
        pyenv global 3.7.3
        pip install -U virtualenv
        pip install -U setuptools
        pip install -U pipenv
    end
end

function setup_ruby
    if type rbenv > /dev/null 2>&1
        echo "source (rbenv init - | psub)" >> ~/.config/fish/config.fish
    end
end

function install_nvm
    git clone https://github.com/nvm-sh/nvm.git ~/.nvm
    omf install bass
    cat <<EOT >> ~/.config/fish/functions/nvm.fish
    function nvm
	    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv;
    end
    EOT
end

function setup_node
    install_nvm
    if type nvm > /dev/null 2>&1
        nvm install node
    end
end

echo "Installing Python"
setup_python
echo "Installing Ruby"
setup_ruby
echo "Installing Node"
setup_node
echo "Done installing languages"