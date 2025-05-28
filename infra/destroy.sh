#!/bin/bash

RESOURCE_GROUP="WinRG"


# Delete the resource group in Azure
az group delete --name $RESOURCE_GROUP --yes