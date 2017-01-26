#!/bin/sh

#set -e

echo "gradle.sh called"
echo "ls -o source-git =========================="
ls source-git
echo "==========================================="

cd source-git
./gradlew assemble


cp build/* compile-out

cp build/lib/* pkg-out

echo "ls ../compile-out=========================="
ls -o ../compile-out

echo "ls ../pkg-out ============================="
ls -o ../pkg-out
echo "======================================="
