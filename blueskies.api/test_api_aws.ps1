$header = @{ "content-type" = "application/json" }

$uri = "https://avr2jrozh1.execute-api.ap-southeast-2.amazonaws.com/Prod/sessions"
$response = invoke-restmethod -Uri $uri -Method Post -Body "" -Headers $header
Write-Host "Session output: $($response | ConvertTo-Json)"

$sessionid = $response.HostedTokenizationId

$body = @{ amount = 100.00; sessionid = $sessionid } | ConvertTo-Json

$uri = "https://avr2jrozh1.execute-api.ap-southeast-2.amazonaws.com/Prod/payments"
$response = invoke-restmethod -Uri $uri -Method Post -Body $body -Headers $header

Write-Host "Payment output: $($response | ConvertTo-Json)"
