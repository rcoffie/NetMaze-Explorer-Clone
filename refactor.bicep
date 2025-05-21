param addressPrefix string = '10.0.0.0/16'
param subnets array = [
  {
    name: 'subnet1'
    addressPrefix: '10.0.1.0/24'
  }
  {
    name: 'subnet2'
    addressPrefix: '10.0.2.0/24'
  }
  {
    name: 'subnet3'
    addressPrefix: '10.0.3.0/24'
  }
]

resource vnetEast 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: 'vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.addressPrefix
      }
    }]
  }
}

// Output section
output vnetName string = vnetEast.name
output vnetLocation string = vnetEast.location
output vnetAddressSpace array = vnetEast.properties.addressSpace.addressPrefixes
output subnetDetails array = [for subnet in subnets: {
  name: subnet.name
  addressPrefix: subnet.addressPrefix
  resourceId: '${vnetEast.id}/subnets/${subnet.name}'
}]
