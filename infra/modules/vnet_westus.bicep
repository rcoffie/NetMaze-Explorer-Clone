@description('Name of the VNet in West US')
param vnetWestName string

@description('Name for subnet 1')
param subnet1Name string

@description('Prefix for subnet 1')
param subnet1Prefix string

resource vnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnetWestName
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
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
