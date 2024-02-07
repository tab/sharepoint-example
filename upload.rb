# frozen_string_literal: true

require 'csv'
require 'sharepoint-ruby'

def auth
  site = Sharepoint::Site.new(ENV.fetch('SHARE_POINT_HOST'), '/')
  site.session.authenticate(ENV.fetch('SHARE_POINT_USERNAME'), ENV.fetch('SHARE_POINT_PASSWORD'))

  site
end

def create_folder(path)
  site = auth
  folder = Sharepoint::Folder.new(site)
  folder.add_folder("#{path}")
end

def get_folder(path)
  site = auth

  begin
    folder  = site.folder(path)
  rescue Sharepoint::SPException
    create_folder(path)
    folder = get_folder(path)
  end

  folder
end

def upload_file(name, content, path)
  folder = get_folder(path)
  folder.add_file(name, content)
end

csv_data = File.open('data/random_data_300Mb.csv')
csv_data = csv_data.read

upload_file('data.csv', csv_data, '/ARCHIVE/TEST/EE-2024-02')
