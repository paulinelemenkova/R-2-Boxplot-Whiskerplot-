#BoxPlot (or WhiskerPlot)

MDepths <- read.csv("Depths.csv", header=TRUE, sep = ",")
MDepth<- data.frame(MDepths, nrow = 1008, ncol = 25)	
MDepthsBoxplot<- boxplot(
	MDepths$profile1, MDepths$profile2, MDepths$profile3, MDepths$profile4, MDepths$profile5, MDepths$profile6, 
	MDepths$profile7, MDepths$profile8, MDepths$profile9, MDepths$profile10, MDepths$profile11, 
	MDepths$profile12, MDepths$profile13, MDepths$profile14, MDepths$profile15, MDepths$profile16, 
	MDepths$profile17, MDepths$profile18, MDepths$profile19, MDepths$profile20, MDepths$profile21, 
	MDepths$profile22, MDepths$profile23, MDepths$profile24, MDepths$profile25,     
	main = "Mariana Trench Depths Boxplot", 
	outline = TRUE,
	outlier.color = "seagreen", outlier.shape = 8, outlier.size = 2,    
#	xlab = "Nr. of profiles",         
	ylab = "Depths",         
	las = 2,         
	col = viridis(25, alpha=.2),         
	names = c("profile1", "profile2", "profile3", "profile4", "profile5", "profile6", "profile7",
"profile8", "profile9", "profile10","profile11", "profile12", "profile13", "profile14", "profile15",
"profile16", "profile17", "profile18", "profile19", "profile20","profile21", "profile22", "profile23",
"profile24", "profile25"))
