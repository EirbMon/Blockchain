#!/bin/bash
Front_Directory='../Front'
FrontBuildContracts_Directory='/src/build/contracts/' 
Back_Directory='../Back'
BackBuildContracts_Directory='/build/contracts/' 
#truffle migrate --reset
#truffle test
cp build/contracts/* $Front_Directory$FrontBuildContracts_Directory
echo "Eirbmon.js copied in :" $Front_Directory$FrontBuildContracts_Directory
cp build/contracts/* $Back_Directory$BackBuildContracts_Directory
echo "Eirbmon.js copied in :" $Back_Directory$BackBuildContracts_Directory


