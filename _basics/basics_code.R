# --------- Sissejuhatus R-i ---------


# --- 1. Kasutajaliides ----

# Seadistame RStudio-t:
## Pane paika kodeerimine (ingl. k. encoding), et RStudio ka täpitähte (õäöü) tunnistaks.
## Tools -> Global Options -> Code -> Savings -> Default text encoding (vali "UTF-8" kui seal on midagi muud)
## 

# Tutvu RStudio kasutajaliidesega, kuhu kirjutada kood, kuhu ilmuvad vastused?
# Kust saab ülevaate hetkel R-i mälus toimuvast?
# Kuhu saab otsida abi? Kuhu ilmuvad pildid?

# --- 1.2 Mõned tehted ----
4 * 6
3 + 5  + (23 - 67)*4
4 * (1:40)
5*6 ; 7 + 8  # kaks käsku ühel rael eraldada semikooloniga


# --- Näited alapunktist: Lihtsam aritmeetika
1 + (2 - 3) * 4/5
2 ^ 3 - 2 ** 3
5 %% 3
log(exp(1)) * cos(-pi) * sqrt(9) + factorial(4) - choose(4, 2) * min(4, 5, 2)

## --- ÜL 1.2.1 KMI arvutamine ----





# --- 1.3 Käsud ja abi saamine ----
choose(4, 2)
choose(n = 4, k = 2)  
choose(k = 2, n = 4)
choose(2, 4)   # kui argumentide nimesid mitte kasutada, siis on oluline argumentide järjekord

# käskudel võivad olla vaikimisi väärtustega argumente
log(5)            # funktsioonil on vaikimisi määratud logaritmi alus 2.718...(Euleri arv), leitakse naturaallogaritm
log(8, base = 2)  # kui vaja leida logaritm alusel 2, peab argumendi 'base' väärtust muutma


?choose

# NB!  R teeb vahet suurtel ja väiksetel tähtedel, proovi:
Log(5)
log(5)

log(8, BASE = 2)
log(8, base = 2)



# --- 2. Muutujad ----

# --- 2.1 väärtuse omistamine muutujale ----
kaal <- 80  
pikkus <- 1.72

kaal # muutuja väärtuse vaatamine

kaal/pikkus ^ 2  # muutujate kasutamine tehtes



# --- 3. Lisapakettide kasutamine ----

# Paigaldame lisapaketi ggplot2 ja talle vajalikud paketid:
install.packages("ggplot2")


# Igal uuel R-i sessioonil tuleb paketid sisse laadida käsuga library:
library(ggplot2)


# -------------------------------------
# ----- Joonised paketiga ggplot2 ----
# -------------------------------------


# lae andmestik "students"
load(url("https://github.com/Rkursus/deltax/raw/master/data/students.RData?raw=true"))

# vaatame andmestiku päist
head(students)

# Hajuvusdiagrammi (scatterplot) tegemiseks
ggplot(students, aes(x = height, y = weight)) + 
  geom_point()


# Värvi saame lisada järgmiselt: colour = tunnuse_nimi
ggplot(students, aes(x = height, y = weight, colour = gender)) + 
  geom_point()

# Uurime erinevaid jooniste võimalusi:

# Funktsioonid facet_grid() ja facet_wrap()
# Näiteks tunnuse 'beer' põhjal saame oma joonise jagada alamjoonisteks (tahkudeks) järgnevalt
ggplot(students, aes(x = height, y = weight, colour = gender)) + 
  geom_point() + 
  facet_wrap(~ beer)


# Histogramm ja jaotused
# geom_histogram()
ggplot(students, aes(x = weight)) + 
  geom_histogram()

# Saame histogrammi tulpasid värvida soo järgi
ggplot(students, aes(x = weight, fill=gender)) + 
  geom_histogram()

# ... Või jagada histogramm tahkudeks soo järgi, üksteise alla
ggplot(students, aes(x = weight, fill=gender)) + 
  geom_histogram() + 
  facet_wrap(~ gender, ncol=1)

# Mitteparameetriline tiheduse hinnang
ggplot(students, aes(x = weight, fill=gender)) + 
  geom_density(alpha=0.5)


# Funktsioonid geom_boxplot() ja geom_jitter()
# Väärtuste hajuvusest ja jaotusest annavad aimu järgmised võimalused:
ggplot(students, aes(x = beer, y = weight)) + geom_boxplot()
ggplot(students, aes(x = beer, y = weight)) + geom_jitter()

# informatiivse joonise saame kahe eelneva kihi (boxploti ja punktide) kombineerimisel
ggplot(students, aes(x = beer, y = weight)) + 
  geom_boxplot() + 
  geom_jitter()


# Funktsioon stat_smooth()
# Saame lisada näiteks regressioonisirge iga grupi jaoks
ggplot(students, aes(x = height, y = weight, colour=gender)) + 
  geom_point() + 
  stat_smooth(method="lm", se=FALSE)
