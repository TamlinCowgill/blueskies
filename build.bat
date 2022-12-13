@echo off
cd C:\src\aws\blueskies
dotnet tool update -g Amazon.Lambda.Tools

cd C:\src\aws\blueskies\blueskies.api
dotnet lambda package

dotnet lambda deploy-serverless
