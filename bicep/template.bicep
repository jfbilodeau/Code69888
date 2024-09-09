// Parameters for the service name and location
param serviceName string
param location string

// Define the App Service Plan resource
resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: '${serviceName}-plan' // Name of the App Service Plan
  location: location // Location of the App Service Plan
  sku: {
    name: 'P0V3' // Pricing tier for the App Service Plan
    tier: 'PremiumV3' // Tier name
  }
  properties: {
    reserved: true // Indicates that this is a Linux App Service Plan
  }
}

// Define the Web App resource
resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: serviceName // Name of the Web App
  location: location // Location of the Web App
  properties: {
    serverFarmId: appServicePlan.id // Link the Web App to the App Service Plan
  }
}

// Output the IDs of the created resources
output appServicePlanId string = appServicePlan.id // Output the App Service Plan ID
output webAppId string = webApp.id // Output the Web App ID
