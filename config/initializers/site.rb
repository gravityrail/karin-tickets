SITE = YAML.load_file("#{Rails.root}/config/site.yml")[Rails.env]
SITE_NAME = SITE['site_name']
