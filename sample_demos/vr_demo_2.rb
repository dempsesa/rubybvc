#! /usr/bin/env ruby

require 'rubybvc'
require 'yaml'

delay = 5

puts "Loading configuration..."
config = YAML.load_file('sample_demos/config_4.yml')

puts "\nStarting Demo 2: Get definition of specific model of vRouter connected "\
  "to Controller"

controller = Controller.new(ip_addr: config['controller']['ip_addr'],
  admin_name: config['controller']['username'],
  admin_password: config['controller']['password'])
vrouter = VRouter5600.new(controller: controller, node_name: config['node']['name'],
  ip_addr: config['node']['ip_addr'], port_number: config['node']['port_num'],
  admin_name: config['node']['username'],
  admin_password: config['node']['password'])
puts "Controller: #{controller.ip}, #{vrouter.name}: #{vrouter.ip}"

puts "\nAdd #{vrouter.name} to controller"
sleep(delay)
response = controller.add_netconf_node(vrouter)
if response.status == NetconfResponseStatus::OK
  puts "#{vrouter.name} added to the controller"
else
  puts "\nDemo terminated: #{response.message}"
  exit
end

puts "\nCheck #{vrouter.name} connection status"
sleep(delay)
response = controller.check_node_conn_status(vrouter.name)
if response.status == NetconfResponseStatus::NODE_CONNECTED
  puts "#{vrouter.name} is connected to the Controller"
else
  puts "\nDemo terminated: #{response.message}"
  exit
end

yang_model_id = "vyatta-security-firewall"
yang_model_version = "2014-11-07"
puts "\nRetrieve #{yang_model_id} YANG model definition from #{vrouter.name}"
sleep(delay)
response = vrouter.get_schema(id: yang_model_id, version: yang_model_version)
if response.status == NetconfResponseStatus::OK
  puts "YANG model definition: #{response.body}"
else
  puts "\nDemo terminated: #{response.message}"
  exit
end

puts "\nEnd of Demo 2"
