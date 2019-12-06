# Blockchain

- Cloner le répertoire Blockchain sur Github
- Ouvrir un terminal, cd /Blockchain/ et utiliser: npm install

- Installer GANACHE TRUFFLE SUITE (a trouver sur internet).
- Aller dans paramètre (écrou).
- Cliquer sur "Add Project".
- Selectionner le fichier de configuration "truffle-config" dans /Blockchain/..
- Cliquer ur "Save and restart" en haut à droite.
- Aller dans paramètre (écrou)
- Aller dans l'onglet SERVER
- Changer le port pour 8545
- Cliquer sur "Save and restart" en haut à droite.
- Cliquer sur "SAVE" dans le menu principal

- Ouvrir un terminal dans /Blockchain/
- Faire: npm install truffle -g
- Faire: truffle compile
- Faire: truffle migrate --reset

- Pour tester: ouvrir le server backend
- Allez sur l'url: http://localhost:4000/api/getAccounts/

This repository is for blockchain deployment
You can add src files to interact with blockchain network by web3 

#compile solidity contracts --> into build repository : 
 truffle compile

#before you migrate your contracts, open your Ethereum client (Ganache for example)

#migrate your contract to your network : truffle migrate --reset

#test that your blocks are perfectly instantiated  : truffle test 


#run initBlockchain.sh to compile,migrate and test the smartContratcs

#run the web server  http://localhost:3000/  : npm run dev 
#you need to activate your wallet and choose a custom RPC network : HTTP://127.0.0.1:7545


#For developement needs :
 
TUTO : 

Ouvrir un terminal sur /Blockchain/:

Ouvrir Ganache et lance bash initBlockchain.sh dans le terminal si ce n'est pas encore fait et lancer : 
- truffle console
- executer ce script Eirbmon.deployed().then(instance=>{app=instance;});web3.eth.getAccounts().then(A=>acc=A)
app est l'instanciation du smart contract, et acc est la liste des comptes utilisés dans Ganache.

- app._Eirbmons(1) est l'Eirbmon n°1 dans notre Blockchain 
- app._Eirbmons(2) est l'Eirbmon n°1 dans notre Blockchain
- app.eirbmonsCount() est le nombre d'Eirbmon qu'on a 
- app.initAccount({from:acc[1]}) permet d'initialiser le compte n°1 et de lui attribuer un Eirbmon
- Vérifier que app.eirbmonsCount() est bien changé.
- app.catchEirbmon(5,{from:acc[2]}) le compte n°2 a attrapé l'Eirbmon orphelin n°5 (Vérifier que l'Eribmon que vous vous attraper est bien un orphelin owner= 0x0000000)
-  app.transferEirbmon(2,acc[2],3,acc[3]) échange l'Eirbmon 2 du compte 2 avec l'Eirbmon 3 du compte 3 (Vérifier bien que les comptes en entré sont bien les propriétaires des Eirbmon à échanger)
 
	
/!\ pour se connecter à sa blockchain local il faut remplacer 192.168.0.23 par 127.0.0.1 dans le fichier truffle-config.js
