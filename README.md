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