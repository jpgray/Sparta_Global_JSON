require 'json'

# json = File.read('json_example.json')
#
# print json.class
json_parsed_data = JSON.parse(File.read('json_example.json'))

p json_parsed_data

print json_parsed_data.class
