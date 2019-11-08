#!/bin/bash
truffle compile
truffle compile --contracts_build_directory=../Back/build
truffle migrate --reset
truffle test

