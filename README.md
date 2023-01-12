# Invopop API Client

Official Ruby Client for the Invopop API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'invopop', github: 'invopop/client.ruby'
```

And then execute:

    $ bundle install

## Usage

```ruby
invopop = Invopop::Client.new(access_token: YOUR_TOKEN) # Get your token from Invopop's console

# Ping
invopop.utils.ping.fetch #=> {"ping"=>"pong"}

# Generate an UUID
invopop.utils.uuid.fetch #=> {"uuid"=>"3099110c-a15a-4b7d-a39a-fa7014b755f0", "version"=>"4"}

# Fetch all GOBL documents in your account
invopop.silo.entries.fetch #=> #<Invopop::Silo::EntryCollection…>

# Fetch a single GOBL document by its UUID
entry = invopop.silo.entries('7ce2c502-925c-11ed-958a-52e43541c80c').fetch #=> #<Invopop::Silo::Entry…>
entry.data #=> #<GOBL::Envelope $schema: "https://gobl.org/draft-0/envelope"…>

# Add a GOBL document to the silo
message = GOBL::Note::Message.new(content: 'Hello world!')
document = GOBL::Document.embed(message)
invopop.silo.entries.create(data: document) #=> #<Invopop::Silo::Entry…>

# Update a GOBL document
invopop.silo.entries("658c4ea1-9264-11ed-958a-52e43541c80c").update(data: document) #=> #<Invopop::Silo::Entry…>

# Create a new job for a workflow and a GOBL document
invopop.transform.jobs.create(
    workflow_id: "5ed30df7-4034-4167-bf8a-03c13f9a39de",
    data: document
) #=> #<Invopop::Transform::Job…>

# Create a new job for a workflow and an existing silo entry
invopop.transform.jobs.create(
  workflow_id: "5ed30df7-4034-4167-bf8a-03c13f9a39de",
  silo_entry_id: "658c4ea1-9264-11ed-958a-52e43541c80c"
) #=> #<Invopop::Transform::Job…>

# Fetch an existing job
invopop.transform.jobs("de0dddf5-926d-11ed-958a-52e43541c80c").fetch #=> #<Invopop::Transform::Job…>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/invopop/client.ruby.
