require "rubygems"
require "braintree"

Braintree::Configuration.environment = :sandbox
Braintree::Configuration.merchant_id = "y8t6jsq7bgkhkqsk"
Braintree::Configuration.public_key = "p73ktghf8v642fkp"
Braintree::Configuration.private_key = "48b865790ee76573bebc3d9c541862da"