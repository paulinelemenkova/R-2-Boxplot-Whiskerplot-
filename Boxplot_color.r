#BoxPlot (or WhiskerPlot)
# ЧАСТЬ 1: делаем data.frame
	# шаг-1. вчитываем таблицу. делаем из нее датафрейм.
MDepths <- read.csv("Depths.csv", header=TRUE, sep = ",")
	# шаг-2. чистим датафрейм от NA значений
MDepths <- na.omit(MDepths) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) # проверяем, удалил ли все NA
sum(row.has.na) # суммируем все NA, должно получиться: [1] 0
head(MDepths) # смотрим очищенный датафрейм. теперь с ним работаем.

# ЧАСТЬ 2: делаем диаграмму распределения данных "whisker boxplot"
	# шаг-3. создаем лист названий профилей	(что будет отображаться по оси X)
profile_names <- paste(c("profile"), seq(1:25), sep="") 
	# шаг-4. строим боксплот по указанным аргументам (здесь: 25 профилей)
p<- boxplot(MDepths$profile1, MDepths$profile2, MDepths$profile3, MDepths$profile4, MDepths$profile5, MDepths$profile6,MDepths$profile7, MDepths$profile8, MDepths$profile9, MDepths$profile10, MDepths$profile11, MDepths$profile12, MDepths$profile13, MDepths$profile14, MDepths$profile15, MDepths$profile16, MDepths$profile17, MDepths$profile18, MDepths$profile19, MDepths$profile20, MDepths$profile21, MDepths$profile22, MDepths$profile23, MDepths$profile24, MDepths$profile25,     
	main = "Mariana Trench Depths Boxplot", 
	outline = TRUE,
	outlier.color = "seagreen", outlier.shape = 8, outlier.size = 2,    
#	xlab = "Profiles",         
	ylab = "Depths",         
	las = 2,         
	col = viridis(25, alpha=.2),         
	names = profile_names)
p