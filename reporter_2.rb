require 'json'
require_relative 'features/support/api_helper.rb'

build_number = ARGV[0]

job_url = ARGV[1]

thumbnail = { 'url' => 'https://cdn.iconscout.com/public/images/icon/premium/png-512/cucumber-vegetable-gherkin-bio-garden-vitamins-3c94daa7f2f6ffaa-512x512.png' }

fields = []
fields.push({ 'name' => 'Jenkins job', 'value' => job_url })
fields.push({ 'name' => 'Build number', 'value' => build_number.to_s })

embed = []
embed.push({'color' => 4387956,
           'fields' => fields,
           'thumbnail' => thumbnail})

payload = { 'content' => 'Automatic message', 'embeds' => embed }.to_json

post("https://discordapp.com/api/webhooks/393067525451022336/uz2WgUi_8-6oS9zy2Pu_3l_-CtQvabdSlgflF_ojyxTxWgxO_8Vdj0qBDMNixDj6wlT1",
     headers: { 'Content-Type' => 'application/json' },
     cookies: {},
     payload: payload)