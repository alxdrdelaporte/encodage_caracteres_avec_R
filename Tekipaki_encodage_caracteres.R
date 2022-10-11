
############################################################################
# Alexander DELAPORTE - CRLAO                                              #
# https://tekipaki.hypotheses.org/                                         #
# https://github.com/alxdrdelaporte/                                       #
# https://gitlab.com/alxdrdelaporte/                                       #
#                                                                          #
#                                                                          #
# R et encodage des caractères                                             #
# https://tekipaki.hypotheses.org/2760                                     #
#                                                                          #
#                                                                          #
############################################################################


## Données d'entrée ##

# https://github.com/alxdrdelaporte/TEKIPAKI/blob/master/lexique_linguistique_japonais.tsv
# https://raw.githubusercontent.com/alxdrdelaporte/TEKIPAKI/master/lexique_linguistique_japonais.tsv

# Chemin d'accès du fichier d'entrée (URL ou chemin d'accès local)
fichier_lexique = "https://raw.githubusercontent.com/alxdrdelaporte/TEKIPAKI/master/lexique_linguistique_japonais.tsv"


## Conversion des données en DataFrame ##

# Essai 1
# -> problème d'encodage du texte en japonais et en français

lexique1 = read.csv(fichier_lexique,
                    sep = '\t',
                    header = TRUE)

print.listof(lexique1)
View(lexique1) 

# Essai 2
# -> texte des cellules affiché correctement avec remplacement des caractères
# spéciaux dans les titres de colonnes

lexique2 = read.csv(fichier_lexique,
                    sep = '\t',
                    header = TRUE,
                    encoding = "UTF-8")

print.listof(lexique2)
View(lexique2)

# Essai 3
# -> désactivation du remplacement des caractères spéciaux dans les titres de
# colonnes (paramètre check.names)

lexique3 = read.csv(fichier_lexique,
                    sep = '\t',
                    header = TRUE,
                    encoding = "UTF-8",
                    check.names = FALSE)

print.listof(lexique3)
View(lexique3)


## Écriture dans données dans un fichier ##
# (inutile ici car reproduit le fichier d'entrée, montré pour l'exemple)
library(data.table)
fwrite(lexique3, "mon_lexique.csv")
