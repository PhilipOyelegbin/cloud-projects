## Severless Movie API

### Step 1: Set Up Your Azure Environment

1. **Install Azure CLI**:
   ```bash
   npm install -g azure-cli
   ```

2. **Log in to Azure**:
   ```bash
   az login
   ```

### Step 2: Create Azure Resources

#### 1. **Create a Resource Group**:
   ```bash
   az group create --name cloudeng --location eastus
   ```

#### 2. **Create a Cosmos DB Account (NoSQL Database)**:
   ```bash
   az cosmosdb create --name movie-db-account --resource-group cloudeng --kind MongoDB
   ```

#### 3. **Create a Cosmos DB Database**:
   ```bash
   az cosmosdb mongodb database create --account-name movie-db-account --name movie-db --resource-group cloudeng
   ```

#### 4. **Create a Cosmos DB Collection**:
   ```bash
   az cosmosdb mongodb collection create --account-name movie-db-account --database-name movie-db --name movies --resource-group cloudeng
   ```

#### 5. **Create a Storage Account**:
   ```bash
   az storage account create --name moviecoverstorage --location eastus --resource-group cloudeng --sku Standard_LRS
   ```

#### 6. **Create a Storage Container**:
   ```bash
   az storage container create --name moviecovers --account-name moviecoverstorage

      # OR use the secure method below

   az storage container create --name moviecovers --account-name moviecoverstorage --connection-string "<your-connection-string>"
   ```

#### 7. **Create a Text Analytics Resource**:
  ```bash
  az cognitiveservices account create \
    --name text-analytics-resource \
    --resource-group cloudeng \
    --kind TextAnalytics \
    --sku S \
    --location eastus \
    --yes
  ```

### Step 3: Set Up the Serverless Functions

1. **Install Azure Functions Core Tools**:
   ```bash
   npm install -g azure-functions-core-tools
   ```

2. **Create a New Function App**:
   ```bash
   az functionapp create --resource-group cloudeng --consumption-plan-location eastus --runtime node --runtime-version 20 --functions-version 4 --name movie-api-func --storage-account moviecoverstorage
   ```

### Step 4: Implement the Serverless Functions

#### 1. **GetMovies Function**:
**`getMovies/index.js`**:
```javascript
const { CosmosClient } = require("@azure/cosmos");

const endpoint = process.env.COSMOS_DB_ENDPOINT;
const key = process.env.COSMOS_DB_KEY;
const client = new CosmosClient({ endpoint, key });
const database = client.database("movie-db");
const container = database.container("movies");

module.exports = async function (context, req) {
    const querySpec = {
        query: "SELECT * from c"
    };

    const { resources: items } = await container.items
        .query(querySpec)
        .fetchAll();

    const response = items.map(item => ({
        id: item.id,
        title: item.title,
        year: item.year,
        coverUrl: `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net/moviecovers/${item.cover}`
    }));

    context.res = {
        status: 200,
        body: response
    };
};
```

#### 2. **GetMoviesByYear Function**:
**`getMoviesByYear/index.js`**:
```javascript
const { CosmosClient } = require("@azure/cosmos");

const endpoint = process.env.COSMOS_DB_ENDPOINT;
const key = process.env.COSMOS_DB_KEY;
const client = new CosmosClient({ endpoint, key });
const database = client.database("movie-db");
const container = database.container("movies");

module.exports = async function (context, req) {
    const year = req.query.year || req.body.year;

    const querySpec = {
        query: "SELECT * from c WHERE c.year = @year",
        parameters: [
            {
                name: "@year",
                value: parseInt(year)
            }
        ]
    };

    const { resources: items } = await container.items
        .query(querySpec)
        .fetchAll();

    const response = items.map(item => ({
        id: item.id,
        title: item.title,
        year: item.year,
        coverUrl: `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net/moviecovers/${item.cover}`
    }));

    context.res = {
        status: 200,
        body: response
    };
};
```

#### 3. **GetMovieSummary Function**:
**`getMovieSummary/index.js`**:
```javascript
const { CosmosClient } = require("@azure/cosmos");
const { TextAnalyticsClient, AzureKeyCredential } = require("@azure/ai-text-analytics");

const endpoint = process.env.COSMOS_DB_ENDPOINT;
const key = process.env.COSMOS_DB_KEY;
const client = new CosmosClient({ endpoint, key });
const database = client.database("movie-db");
const container = database.container("movies");

const textAnalyticsEndpoint = process.env.TEXT_ANALYTICS_ENDPOINT;
const textAnalyticsApiKey = process.env.TEXT_ANALYTICS_API_KEY;
const textAnalyticsClient = new TextAnalyticsClient(textAnalyticsEndpoint, new AzureKeyCredential(textAnalyticsApiKey));

module.exports = async function (context, req) {
    const movieId = req.query.id || req.body.id;

    const { resource: movie } = await container.item(movieId).read();

    const [result] = await textAnalyticsClient.extractSummary([movie.description]);

    const summary = result.sentences.map(sentence => sentence.text).join(" ");

    context.res = {
        status: 200,
        body: { id: movie.id, title: movie.title, year: movie.year, summary }
    };
};
```

### Step 5: Configure Environment Variables

Ensure you set the required environment variables in the Azure Function App configuration:
- `COSMOS_DB_ENDPOINT`
- `COSMOS_DB_KEY`
- `STORAGE_ACCOUNT_NAME`
- `TEXT_ANALYTICS_ENDPOINT`
- `TEXT_ANALYTICS_API_KEY`

### Step 6: Deploy Your Functions

Deploy your functions to Azure:
```bash
func azure functionapp publish movie-api-func
```

### Step 7: Test Your API

Use Postman or any other tool to test your API endpoints and ensure everything is working as expected.

By following these steps, you'll set up a serverless movie API on Azure with a NoSQL database, cloud storage, and serverless functions for movie retrieval and summary generation. If you have any questions or need further assistance, feel free to ask!