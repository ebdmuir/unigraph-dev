import Client from './dgraphClient';
import startServer from './server';

async function main() {
  const client = new Client(process.env.DGRAPH_URL || 'localhost:9080');
  const [app, server] = await startServer(client);

  server.on('close', () => (console.log('CLOSING'), client.close()));
}

main();