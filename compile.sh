export PORT=4000
export MIX_ENV=dev
export DATABASE_URL=postgresql://postgres:@localhost:5432/explorer?ssl=false
export CHAIN_SPEC_PATH=./docker/spec.json
export BLOCKSCOUT_PROTOCOL=http
export BLOCKSCOUT_HOST=0.0.0.0
export ETHEREUM_JSONRPC_VARIANT=parity
export ETHEREUM_JSONRPC_HTTP_URL=http://138.68.71.224:8545
export ETHEREUM_JSONRPC_WS_URL=ws://138.68.71.224:8546
export ETHEREUM_JSONRPC_TRACE_URL=http://138.68.71.224:8545
mix do deps.get, local.rebar --force, deps.compile
mix compile
cd apps/block_scout_web/assets/ && npm install && npm run deploy && cd -
cd apps/explorer/ && npm install && cd -
mix phx.digest