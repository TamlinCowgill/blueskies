$header = @{ "content-type" = "application/json" }

$uri = "https://avr2jrozh1.execute-api.ap-southeast-2.amazonaws.com/Prod/sessions"
$response = invoke-restmethod -Uri $uri -Method Post -Body $body -Headers $header

$session = $response.content | convertfrom-json
$sessionid = $session.HostedTokenizationId

$body = @{ amount = 100.00; sessionid = $sessionid } | ConvertTo-Json

$uri = "https://avr2jrozh1.execute-api.ap-southeast-2.amazonaws.com/Prod/payments"
$response = invoke-restmethod -Uri $uri -Method Post -Body $body -Headers $header

