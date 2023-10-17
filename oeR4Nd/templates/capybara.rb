Capybara.javascript_driver = :selenium_chrome
Capybara.asset_host = 'http://127.0.0.1:3000'

# capybara-screenshot
Capybara::Screenshot.prune_strategy = { keep: 20 }
Capybara::Screenshot.autosave_on_failure = true