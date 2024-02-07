# frozen_string_literal: true

require 'csv'

ROW_SIZE = 100
TARGET_FILE_SIZE_MB = 10

target_file_size_bytes = TARGET_FILE_SIZE_MB * 1024 * 1024
num_rows = target_file_size_bytes / ROW_SIZE

def generate_random_row
  (0...ROW_SIZE).map { ('a'..'z').to_a[rand(26)] }.join(',')
end

CSV.open('data/random_data.csv', 'wb') do |csv|
  num_rows.times do
    csv << [generate_random_row]
  end
end

puts "CSV file generated with approximately #{File.size('random_data.csv') / (1024 * 1024)} MB"
