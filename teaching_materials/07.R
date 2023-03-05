###############################
### M U S T E R L Ö S U N G ###
###############################

# Ausgangssituation
iris

# Deksriptive Analyse
summary(iris)
boxplot(iris[1:4])
setosa <- subset(iris, Species=="setosa")
versicolor <- subset(iris, Species=="versicolor")
virginica <- subset(iris, Species=="virginica")
summary(setosa[c(1:4)])
summary(versicolor[c(1:4)])
summary(virginica[c(1:4)])

# Bivariate Analyse
cor(iris[1:4])

# Grafische Darstellung zur Mustererkennung
par(mfrow=c(2,2))
boxplot(setosa[c(1:4)], main="setosa", ylim=c(1,8))
boxplot(versicolor[c(1:4)], main="versicolor", ylim=c(1,8))
boxplot(virginica[c(1:4)], main="virginica", ylim=c(1,8))

# Mustererkennung - Setosa
identification <- subset(iris, Petal.Length>="1" & Petal.Length<="2" & Petal.Width<="1", select=c(Species))
summary(identification)

# Mustererkennung - Versicolor
identification <- subset(iris, Petal.Length>="3" & Petal.Length<="5" & Petal.Width<="2", select=c(Species))
summary(identification)

# Mustererkennung - Virginica
identification <- subset(iris, Petal.Length>="4.5" & Petal.Width>="1.6", select=c(Species))
summary(identification)