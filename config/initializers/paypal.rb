PAYPAL_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/paypal.yml")[Rails.env]
ActiveMerchant::Billing::PaypalExpressGateway.default_currency = PAYPAL_CONFIG['currency']
