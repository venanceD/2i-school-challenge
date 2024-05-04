import '../models/Question.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "EN QUELLE ANNEE EST NEE LE LANGUAGE JAVA ?",
    {
      "1995": false,
      "2000": false,
      "1991": true,
      "1880": false,
    },
  ),
  QuestionModel("EN QUELLE ANNEE EST CREE LE LANGUAGE JAVA ?", {
    "1991": false,
    "1992": false,
    "1889": false,
    "1995": true,
  }),
  QuestionModel(
      "Linux: Quel commande permettant de passer au mode Super-utilisateur ?", {
    "Apt-get mkdir": false,
    "sudo su": true,
    "sudo add user": false,
    "sudo user add": false,
  }),
  QuestionModel("Quelle est la classe B", {
    "1.0.0.0 à 126.0.0.0": false,
    "192.0.0.0 à 223.255.255.0": false,
    "128.0.0.0 à 191.255.0.0": true,
    "193.0.0.0 à 220.0.0.0": false,
  }),
  QuestionModel("QUE signifie ADDS Sur WINDOWS SERVER ?", {
    "Active Directory Domain Services": true,
    "Active Directory Certificate Services": false,
    "Active Directory Document Services": false,
    "Active Directory Direction Services": false,
  }),
  QuestionModel("Quelle bibliothèque en java permet de creer la JFrame ?", {
    "AWT": false,
    "EVENT": false,
    "SWING": true,
    "SQL": false,
  }),
  QuestionModel("QUELLE EST LA DERNIERE VERSION DE WINDOWS SERVER ?", {
    "Windows Server 2012.": false,
    "Windows Server 2012 R2.": false,
    "Windows Server 2016 R2": false,
    "Windows Server 2022": true,
  }),
  QuestionModel("Quelle est la dernière version de Linux ?", {
    "DEBIAN": false,
    "UBUNTU": false,
    "Linux Mint 21.2 « Victoria »": true,
    "UBUNTU LTS": false,
  }),
  QuestionModel(" C'est quoi la classe abstraite ?", {
    "Une méthode dont seule la signature": false,
    "Une classe qui doit être instanciée": false,
    "une classe est abstraite si elle contient au moins une méthode abstraite":
        true,
    "Une classe contenant une methode Main": false,
  }),
  QuestionModel(
      "UNITY utilise quelle language pour programme des jeux videos ?", {
    "C#": true,
    "C++": true,
    "JAVA": false,
    "C": false,
  }),
];
