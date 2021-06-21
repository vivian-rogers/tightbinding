#first, one should install WSL2, Vcxsrv, and windows terminal for unicode support

#install julia & graphics

echo "Installing Julia programming language, QT for graphics"
sudo apt-get update
sudo apt-get install julia
sudo apt-get install qt5-default

echo "Adding display path to .bashrc"
echo "export DISPLAY=\$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0\nunset LIBGL_ALWAYS_INDIRECT" >> ~/.bashrc


echo "Installing necessary julia packages..."
julia << EOF
using Pkg

Pkg.add("LinearAlgebra")
Pkg.add("Plots")
Pkg.add("PyPlot")
EOF


echo "Installing julia-vim with LaTeX support"
cd ~/.vim
mkdir -p pack/plugins/start && cd pack/plugins/start
git clone git://github.com/JuliaEditorSupport/julia-vim.git


echo "Install done (if run without errors), launch Vcxsrv with -1, unclick native openGL,"
echo "click disable access control (so wsl2 can use it), and type 'julia -i Holmium.jl'"
