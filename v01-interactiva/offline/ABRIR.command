#!/bin/bash
# TRAMA Offline — abre automaticamente no Chrome em kiosk
cd "$(dirname "$0")"
PORT=8080
# Kill any previous instance on this port
lsof -ti:$PORT | xargs kill -9 2>/dev/null
# Start local server in background
python3 -m http.server $PORT &
SERVER_PID=$!
sleep 1
# Open in Chrome (kiosk flag for true kiosk)
if [ -d "/Applications/Google Chrome.app" ]; then
  open -a "Google Chrome" "http://localhost:$PORT/index.html" --args --kiosk
else
  open "http://localhost:$PORT/index.html"
fi
# Wait for user to close (Ctrl+C in terminal)
echo "TRAMA a correr em http://localhost:$PORT"
echo "Pressiona Ctrl+C para parar."
wait $SERVER_PID
