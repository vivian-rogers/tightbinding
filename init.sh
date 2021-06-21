

#install julia & graphics

echo "Installing Julia programming language, QT for graphics"
sudo apt-get install julia
sudo apt-get install qt5-default



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

