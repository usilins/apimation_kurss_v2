require_relative 'features/support/api_helper.rb'
require 'json'

embed = []

thumbnail = { 'url' => 'https://cdn.iconscout.com/public/images/icon/premium/png-512/cucumber-vegetable-gherkin-bio-garden-vitamins-3c94daa7f2f6ffaa-512x512.png' }
fields = []
fields.push({ 'name' => 'Author', 'value' => 'Uldis Siliņš' })
embed.push('title' => 'Rich content!',
           'color' => 16007746,
           'thumbnail' => thumbnail,
           'fields' => fields)

payload = { 'content' => 'Automatic Message from Jenkins!',
            'embeds' => embed }.to_json

response = post("https://discordapp.com/api/webhooks/390216573987586049/cIEeWrV6jCqQFnzv9qpDVwd35Bn9EXNNPWd1yz0EXIinlI8aKv_UsZWF27alob-5iaYB",
                headers: { 'Content-Type' => 'application/json' },
                cookies: {},
                payload: payload)
