# Projet de Système Informatique
### Jean-Rémy Hok - Valentin Saulnier / Groupe A1 / Année 2020 - 2021  
## 1 - Compilateur 
La partie compilateur se trouve dans le dossier compilateur/  
Il prend en entrée un fichier au language de type C, puis produit un fihcier au language assembleur orienté mémoire.
Makefile : 
  * make run 
  * make execute
Particularités : 
  * _tmp{i} pour les variables temporaires

## 2 - Interpréteur 
L'interpreteur est fourni et se trouve dans le dossier interpreter/ .  
Il permet de traduire l'assembleur orienté mémoire en assembleur orienté registre.

## 3 - Processeur
Particularités de notre processeur : 
  * Utilisation d'un compteur pour la mémoire des instructions : facilite l'implémentation des bulles et des jumps
    * Enable => Bulles (envoi de NOP)
    * LOAD + Din => Jump à une instruction donnée
  * Gestion des aléas/bulles avec les booléens aléas

## 4 - Rapport 
