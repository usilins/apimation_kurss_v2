require 'json'
require_relative 'features/support/api_helper.rb'


thumbnail = { 'url' => 'https://cdn.iconscout.com/public/images/icon/premium/png-512/cucumber-vegetable-gherkin-bio-garden-vitamins-3c94daa7f2f6ffaa-512x512.png' }

fields = []
fields.push({ 'name' => 'Author', 'value' => 'US' })
fields.push({ 'name' => 'Position', 'value' => 'QA Engineer' })

embed = []
embed.push({'title' => 'Rich content',
           'color' => 4387956,
           'fields' => fields,
           'thumbnail' => thumbnail})

payload = { 'content' => 'Automatic message', 'embeds' => embed }.to_json

post("https://discordapp.com/api/webhooks/393067525451022336/uz2WgUi_8-6oS9zy2Pu_3l_-CtQvabdSlgflF_ojyxTxWgxO_8Vdj0qBDMNixDj6wlT1",
     headers: { 'Content-Type' => 'application/json' },
     cookies: {},
     payload: payload)