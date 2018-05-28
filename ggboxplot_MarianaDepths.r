# BoxPlot (or WhiskerPlot) using ggboxplot // используем не обычную встроенную в R Basic Graphics функцию boxplot, а ggboxplot (более функциональную, advanced). Тут можно менять палитру, настраивать оси и наводить красоту. В обычном boxplot функции красоты очень ограниченны. 

# шаг-1. вчитываем таблицу. делаем из нее датафрейм. говорим сколько колонок и строк.
MDepths <- read.csv("Depths.csv", header=TRUE, sep = ",")
MDepth<- data.frame(MDepths, nrow = 1008, ncol = 25)

# шаг-2. чистим датафрейм от NA значений
df<- na.omit(MDepth) 
row.has.na <- apply(df, 1, function(x){any(is.na(x))}) # проверяем, удалил ли все NA
sum(row.has.na) # суммируем все NA, должно получиться: [1] 0
df # смотрим очищенный датафрейм. теперь с ним работаем.

# шаг-3. задаем чистый датафрейм MDepths_df. говорим что по X (profiles), что по Y(depths).
MDepths_df <- data.frame(profiles = 1:25, depths = c(df$profile1, df$profile2, df$profile3, df$profile4, df$profile5, df$profile6, df$profile7, df$profile8, df$profile9, df$profile10, df$profile11, df$profile12, df$profile13, df$profile14, df$profile15, df$profile16, df$profile17, df$profile18, df$profile19, df$profile20, df$profile21, df$profile22, df$profile23, df$profile24, df$profile25)) 

# шаг-4. чертим боксплот по датафрейму MDepths_df. наводим красоту (палитра, линии).
ggboxplot_MDepths<- ggboxplot(
	MDepths_df, 
	x = "profiles", 
	y = "depths", 
	width = 0.5, 
	color = "profiles", 
	fill = "profiles",
	palette =c("magma")
	)

# шаг-5. сохраняем боксплот в pdf.	
ggsave("ggboxplot_MarianaDepths.pdf", device = cairo_pdf, fallback_resolution = 300, width = 210, height = 297, units = "mm")
