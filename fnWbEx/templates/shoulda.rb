# https://matchers.shoulda.io/docs/v6.4.0/#rspec

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end