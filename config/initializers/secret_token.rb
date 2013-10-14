# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TryMongodb::Application.config.secret_key_base = 'fc79c69b94c3149f4589be3a4a447ee65d5adfff43b607f80f1db7bc596ebc1a168925ffab55faa6740c4c49f34b89771574a7b3c5d7470d48c8118602ff1933'
