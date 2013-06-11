CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['CLARITYBOX_S3_KEY'],
    :aws_secret_access_key  => ENV['CLARITYBOX_S3_SECRET'],
  }
  config.fog_directory = 'claritybox'
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
