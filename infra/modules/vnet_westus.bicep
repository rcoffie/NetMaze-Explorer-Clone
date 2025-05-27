param location string = 'eastus'
param addressSapace string = '10.0.0.0/16'
param defaultSubnetName string = 'defaultSubnet'
param defaultSubnetPrefix string = '10.0.0.1/16'
param vnetWestName string = 'vnetWest'



resource vnetWest 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetWestName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressSapace
      ]
    }

  }
}

resource defaultSubnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
   name: defaultSubnetName
   properties: {addressPrefix: defaultSubnetPrefix }
   dependsOn:[
    vnetWest
   ]
}

output vnetWestid string = vnetWest.id
output defaultSubnet string = defaultSubnet.id
