require 'aws-sdk-s3'

# def object_uploaded?(s3_client, bucket_name, object_key)
# response = s3_client.put_object(
#     bucket: bucket_name,
#     key: object_key
# )
# if response.etag
#     return true
# else
#     return false
# end
# rescue StandardError => e
# puts "Error uploading object: #{e.message}"
# return false
# end

  
# if object_uploaded?(s3_client, bucket_name, object_key)
#   puts "Object '#{object_key}' uploaded to bucket '#{bucket_name}'."
# else
#   puts "Object '#{object_key}' not uploaded to bucket '#{bucket_name}'."
# end

  
# Full example call:
def run_me
bucket_name = 'nutrient-facts'
object_key = 'my-file.txt'
region = 'us-east-1'
creds = Aws::Credentials.new('api')
s3_client = Aws::S3::Client.new(region: region, credentials: creds)

s3 = Aws::S3::Resource.new(
    credentials: creds,
    region: 'us-east-1'
)

obj = s3.bucket('nutrient-facts').object('key')
obj.upload_file('./Gemfile', acl:'public-read')
puts obj.public_url

end

  run_me