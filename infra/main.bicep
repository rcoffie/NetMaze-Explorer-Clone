// param vnetEastName string = 'vnetEast'
// param vnetWestName string = 'vnetWest'


module vnetEast 'modules/vnet_eastus.bicep' = {
  name: 'vnetEastDeployment'
  params: {}
}

module vnetWest 'modules/vnet_westus.bicep' = {
  name: 'vnetWestDeployment'
  params: {}
}



// output eastVnetId string = vnetEast.outputs.vnetResourceId
// output westVnetId string = vnetWest.outputs.vnetResourceId
