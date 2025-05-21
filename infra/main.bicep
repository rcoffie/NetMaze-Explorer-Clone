param vnetEastName string = 'vnetEast'
param vnetWestName string = 'vnetWest'

module vnetEast 'modules/vnet_eastus.bicep' = {
  name: 'vnetEastDeployment'
  params: {
    vnetEastName: vnetEastName
    subnet1Name: 'webAppSubnet'
    subnet1Prefix: '10.0.1.0/24'
  }
}

module vnetWest 'modules/vnet_westus.bicep' = {
  name: 'vnetWestDeployment'
  params: {
    vnetWestName: vnetWestName
    subnet1Name: 'defaultSubnet'
    subnet1Prefix: '10.1.1.0/24'
  }
}

output eastVnetId string = vnetEast.outputs.vnetResourceId
output westVnetId string = vnetWest.outputs.vnetResourceId
