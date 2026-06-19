param location string = resourceGroup().location

var commonTags = {
  Environment: 'Development'
  Owner: 'Nassim'
  CostCenter: 'IT'
}

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: 'law-nassim-dev'
  location: location
  tags: commonTags

  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: 'kv-nassim-dev-2026'
  location: location
  tags: commonTags

  properties: {
    tenantId: subscription().tenantId

    sku: {
      family: 'A'
      name: 'standard'
    }

    enableRbacAuthorization: true
  }
}

output workspaceName string = logAnalytics.name
output keyVaultName string = keyVault.name
