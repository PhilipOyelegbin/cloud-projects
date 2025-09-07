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
        value: parseInt(year),
      },
    ],
  };

  const { resources: items } = await container.items
    .query(querySpec)
    .fetchAll();

  const response = items.map((item) => ({
    id: item.id,
    title: item.title,
    year: item.year,
    coverUrl: `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net/moviecovers/${item.cover}`,
  }));

  context.res = {
    status: 200,
    body: response,
  };
};
