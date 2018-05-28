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
	title = "Mariana Trench: \nNotched Boxplot for Data Groups by 25 Profiles",
	x = "profiles", 
	y = "depths", 
#	add = "jitter",
	width = 0.8, 
	notch = TRUE,
	fill = "profiles",
#	color = "black", 	
	linetype = 1, size = .1,
#	outlier.colour = "grey44",
	palette = c("magma"),
#	size = 1,
	orientation = "horizontal"
	) 
   
# шаг-5 добавляем обертку темы (легенда, оси, подписи и пр.)
p<- ggboxplot_MDepths + 
	theme(
    plot.title = element_text(family = "Skia", face = 2, size = 10),
    panel.background=ggplot2::element_rect(fill = "white"),
    legend.justification = c(.85, .1), 
    legend.position = c(.85, .1),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6),
    legend.direction = "vertical",
    legend.background = element_rect(fill = "white"),
    legend.key.width = unit(.3,"cm"),
    legend.key.height = unit(.3,"cm"),
    legend.spacing = unit(.3,"cm"),
    legend.box.background = element_rect(colour = "honeydew4",size=0.2),
    legend.text = element_text(family = "Arial", colour="black", size=6, face=1),
    legend.title = element_text(family = "Arial", colour="black", size=6, face=1),
    strip.text.x = element_text(colour = "white"),
    panel.grid.major = element_line("gray24", size = 0.1, linetype = "dotted"),
    panel.grid.minor = element_line("gray24", size = 0.1, linetype = "dotted"),
    axis.text.x = element_text(family = "Arial", face = 3, color = "gray24",size = 5, angle = 15),
    axis.text.y = element_text(family = "Arial", face = 3, color = "gray24",size = 4, angle = 90),
    axis.ticks.length=unit(.1,"cm"),
    axis.line = element_line(size = .3, colour = "grey80"),
    axis.title.y = element_text(margin = margin(t = 20, r = .3), family = "Times New Roman", face = 1, size = 6),
    axis.title.x = element_text(family = "Times New Roman", face = 1, size = 6,margin = margin(t = .2)))

# шаг-6. сохраняем боксплот в pdf.	
ggsave("ggboxplot_MarianaDepths.pdf", device = cairo_pdf, fallback_resolution = 300, width = 210, height = 297, units = "mm")