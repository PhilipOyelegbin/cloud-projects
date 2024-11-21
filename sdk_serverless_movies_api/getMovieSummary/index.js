const { CosmosClient } = require("@azure/cosmos");
const {
  TextAnalyticsClient,
  AzureKeyCredential,
} = require("@azure/ai-text-analytics");

const endpoint = process.env.COSMOS_DB_ENDPOINT;
const key = process.env.COSMOS_DB_KEY;
const client = new CosmosClient({ endpoint, key });
const database = client.database("movie-db");
const container = database.container("movies");

const textAnalyticsEndpoint = process.env.TEXT_ANALYTICS_ENDPOINT;
const textAnalyticsApiKey = process.env.TEXT_ANALYTICS_API_KEY;
const textAnalyticsClient = new TextAnalyticsClient(
  textAnalyticsEndpoint,
  new AzureKeyCredential(textAnalyticsApiKey)
);

module.exports = async function (context, req) {
  const movieId = req.query.id || req.body.id;

  const { resource: movie } = await container.item(movieId).read();

  const [result] = await textAnalyticsClient.extractSummary([
    movie.description,
  ]);

  const summary = result.sentences.map((sentence) => sentence.text).join(" ");

  context.res = {
    status: 200,
    body: { id: movie.id, title: movie.title, year: movie.year, summary },
  };
};
