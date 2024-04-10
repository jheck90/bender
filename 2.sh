WEBHOOK="https://discord.com/api/webhooks/1227627813230612581/h23CZ3Wjxc1I8MC5Swv3n7tlFKIg5AayTk3Y9ELNVCMXDK-cDvh-IoZEiiTxCHyMX4KI"
MESSAGE="why is this not working"
DISCORD_MENTIONS="@jheck90"
COLOR="4383476"
embed=$(jq -n \
  --arg title "$TITLE" \
  --arg url "$TITLE_LINK" \
  --arg description "${MESSAGE} ${CIRCLE_BUILD_URL}" \
  --arg color "$COLOR" \
  --arg ts "$TS" \
  --arg footer "$FOOTER" \
  '{
    title: $title,
    url: $url,
    description: $description,
    color: $color,
    timestamp: $ts,
    footer: $footer
  }')

echo "$embed"


    curl -X POST -H 'Content-type: application/json' \
    -d "{
      \"content\": \"${MESSAGE} ${DISCORD_MENTIONS}\",
      \"embeds\": [$embed]
    }" \
    $WEBHOOK