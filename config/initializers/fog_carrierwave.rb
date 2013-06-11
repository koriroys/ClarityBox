CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIMZAREP3R6ZG7JSQ',
    :aws_secret_access_key  => '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',
  }
  config.fog_directory = 'claritybox'
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
