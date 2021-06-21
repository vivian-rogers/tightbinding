
module PlotStuff
#using Plots
using PyPlot

export plotBands, plotVec

function plotVec(x,yvecs, title)
	nY = size(yvecs)[1]
	for i = 1:nY
		plot(x,yvecs[i])
	end
	title(title)
	gcf()
end

function plotBands(klist, nk, E, projStates)
	#Plots.pyplot()
	nSymPts = size(klist)[1]
	indices = LinRange(0,nSymPts-1, size(E)[1])
	nE = size(E)[2]
	#display(E[:,1])
	#display(plot!(indices,E[1,:]))
	#display(plot!(indices,E[:,2]))
	#Eplot = transpose(E)
	kSymPts = [i for i =0:(nSymPts-1)]
	for kTick in kSymPts
		plot([kTick,kTick],[-30,30],c="#666666",lw=0.5)
	end
	xticks(kSymPts,klist)
	xlim(0, nSymPts-1)
	maxE = maximum(E)
	minE = minimum(E)
	ylabel("E - Ef (eV)")
	ylim(minE-0.5,maxE+0.5)


	set_cmap("rainbow")
	for iE = 1:nE
		Evals = collect(E[:,iE])
		Projvals = collect(projStates[:,iE])
		#Projvals = collect(projStates[:,iE])
		scatter(indices,Evals,c=Projvals, vmin=0, vmax=1,s=0.9)
		#display(plot!(indices,Evals))
	end
	gcf()
end


function plotBands(klist, nk, E)
	#Plots.pyplot()
	nSymPts = size(klist)[1]
	indices = LinRange(0,nSymPts-1, size(E)[1])
	nE = size(E)[2]
	#display(E[:,1])
	#display(plot!(indices,E[1,:]))
	#display(plot!(indices,E[:,2]))
	#Eplot = transpose(E)
	kSymPts = [i for i =0:(nSymPts-1)]
	for kTick in kSymPts
		plot([kTick,kTick],[-30,30],c="#666666",lw=0.5)
	end
	xticks(kSymPts,klist)
	xlim(0, nSymPts-1)
	maxE = maximum(E)
	minE = minimum(E)
	ylabel("E - Ef (eV)")
	ylim(minE-0.5,maxE+0.5)
	for iE = 1:nE
		Evals = collect(E[:,iE])
		plot(indices,Evals)
		#display(plot!(indices,Evals))
	end
	gcf()
end

end
