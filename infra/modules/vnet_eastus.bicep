@description('Name of the VNet in East US')
param vnetEastName string

@description('Name for subnet 1')
param subnet1Name string

@description('Prefix for subnet 1')
param subnet1Prefix string

resource vnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetEastName
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
    ]
  }
}

output vnetResourceId string = vnet.id
