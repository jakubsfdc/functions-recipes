#If you haven't already done so, authorize with your org and provide it with an alias (fnrecipesorg in the command below):
sfdx auth:web:login -d -a fnrecipesorg
#Clone the functions-recipes repository:
git clone https://github.com/trailheadapps/functions-recipes
cd functions-recipes
#Create a scratch org and provide it with an alias (functions_recipes in the command below):
sfdx force:org:create -s -f config/project-scratch-def.json -a functions_recipes

#Login to your Salesforce Functions account:
sf login functions
#Create a Compute Environment to deploy the functions and connected it to your org:
sf env create compute --connected-org=functions_recipes --alias=recipes_env
#Deploy the functions
sf deploy functions --connected-org=functions_recipes
#Push source app to the scratch org:
sfdx force:source:push -f
#Assign the FunctionsRecipes permission set to the default user:
sfdx force:user:permset:assign -n FunctionsRecipes
#Assign the Functions permission set to the default user:
sfdx force:user:permset:assign -n Functions
#Open the Functions Recipes App
sfdx force:org:open -p "/lightning/n/Functions"
#Activate the Functions Recipes Theme (Optional)
sfdx force:org:open -p "/lightning/setup/ThemingAndBranding/home"