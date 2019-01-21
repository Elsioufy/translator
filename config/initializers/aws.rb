# require 'aws-sdk'

filename = File.expand_path(File.join(Rails.root, "config", "aws.yml"))
config = YAML.load_file(filename)
aws_config = config[Rails.env.to_s].symbolize_keys

Aws.config.update({
                      region: aws_config[:region],
                      credentials: Aws::Credentials.new(aws_config[:access_key_id], aws_config[:secret_access_key])
                  })
