local module = {}
module.Webhook = ""
local HTTPService = game:GetService("HttpService")

function module:SetWebhook(WebhookURL)
    self.Webhook = WebhookURL
    return
end

function module:Check()
    if self.Webhook == "" then
        error("ERROR | No webhook specified.")
    else
        warn("SYSTEM | Sent a message to channel. If no message is sent, check your URL or use a proxy service.")
        HTTPService:PostAsync(self.Webhook, HTTPService:JSONEncode({
            content = "If you see this message, this means that your webhook is configured properly."
        }))
    end
end

function module:Send(Message)
    if self.Webhook == "" then
        error("ERROR | No webhook specified.")
    end
    HTTPService:PostAsync(self.Webhook, HTTPService:JSONEncode({content = Message}))
end

function module:Embed(Message, EmbedTitle, EmbedDescription, EmbedHexColorCode)
    if self.Webhook == "" then
        error("ERROR | No webhook specified.")
        return
    end
    if Message == "" then
        error('ERROR | Message text cannot be empty. Set Message text as "" if you don\'t want to include a message')
    end
    if EmbedTitle == "" then
        EmbedTitle = "Game ID = "..game.PlaceId
    end
    if EmbedDescription == "" then
        EmbedDescription = "Unspecified"
    end
    if EmbedHexColorCode == "" then
        EmbedHexColorCode = tonumber(0xffffff)
    end

    local data = HTTPService:JSONEncode({
        ["content"] = Message,
        ["embeds"] = {{
            ["title"] = tostring(EmbedTitle),
            ["description"] = tostring(EmbedDescription),
            ["type"] = "rich",
            ["color"] = EmbedHexColorCode,
        }}
    })

    HTTPService:PostAsync(self.Webhook, data)
end
Discord = module
Discord.__index = Discord
return module
