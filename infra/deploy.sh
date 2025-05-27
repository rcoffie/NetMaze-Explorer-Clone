#!/bin/bash

RESOURCE_GROUP="WinRG"
LOCATION="eastus"


# az group create --name $RESOURCE_GROUP --location $LOCATION
# Check if the resource group exists, if not create it
az group show --name "YourResourceGroup" >/dev/null 2>&1 || az group create --name $RESOURCE_GROUP --location $LOCATION


# Deploy the Bicep template
az deployment group create --resource-group $RESOURCE_GROUP --template-file main.bicep
